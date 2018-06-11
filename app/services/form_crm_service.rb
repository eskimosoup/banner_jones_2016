# frozen_string_literal: true

class FormCrmService
  def initialize(object, referer, visitor_key)
    @object = object
    @referer = referer
    @visitor_key = visitor_key
  end

  def call
    check_visitor_key
    Post.new(map_postable_fields.merge(map_combined_fields), referer).call
  rescue CdVisitorKeyMissing => e
    CustomLogger
      .new('click_dimensions')
      .fatal(e.message)
  end

  private

  attr_reader :object, :referer, :visitor_key

  def check_visitor_key
    raise CdVisitorKeyMissing, 'Visitor key missing' if visitor_key.blank?
  end

  def map_postable_fields
    {
      'contact[email]' => object.try(:email),
      'contact[telephone]' => object.try(:telephone),
      'contact[forename]' => object.try(:forename),
      'contact[surname]' => object.try(:surname),
      'contact[preferred_contact_method]' => object.try(:preferred_contact_method),
      'contact[how_heard]' => object.try(:how_heard),
      'cd_visitorkey' => visitor_key
    }
  end

  def map_combined_fields
    {
      'contact[message]' => [form_subject,
                             combined_fields
                               .map { |x| [x.humanize, [object.public_send(x), "\n"].join] }
                               .join("\n")].join
    }
  end

  def form_subject
    "Subject\n#{[object.class.model_name.human.titleize, 'submission'].join(' ')}\n"
  end

  def excluded_keys
    %w[errors validation_context cd_visitorkey]
  end

  def combined_fields
    JSON.parse(object.to_json)
        .keys
        .delete_if { |k, _v| map_postable_fields.keys.include?("contact[#{k}]") }
        .delete_if { |k, _v| excluded_keys.include?(k) }
  end

  class Post
    URL = 'http://analytics-eu.clickdimensions.com/forms/h/aPbb09lIdt0mVE5hnWx0QA'
    # URL = 'http://192.168.0.26:3000'

    def initialize(hash, referer)
      @hash = hash
      @referer = referer
    end

    def call
      post
    end

    private

    attr_reader :hash, :referer

    def post
      require 'net/http'
      require 'uri'

      uri = URI(URL)
      req = Net::HTTP::Post.new(uri, headers)
      req.set_form_data(hash)

      res = Net::HTTP.start(uri.host, uri.port) do |http|
        http.request(req)
      end

      post_callback(res)
    end

    def post_callback(res)
      case res
      when Net::HTTPSuccess, Net::HTTPRedirection
        if res.header.location.include?('form-success')
          CustomLogger.new('click_dimensions').info('Successful submission')
        else
          CustomLogger.new('click_dimensions').fatal(res.to_yaml)
        end
      else
        CustomLogger
          .new('click_dimensions')
          .fatal(res.to_yaml)
      end
    end

    def headers
      {
        'Referer' => referer,
        'Content-Type' => 'application/x-www-form-urlencoded',
        'Charset' => 'UTF-8'
      }
    end
  end

  class CustomLogger
    attr_reader :log_file

    def initialize(log_file)
      @log_file = log_file
    end

    # debug, info, warn, error, fatal
    def fatal(message = nil)
      return if message.blank?
      custom_logger.fatal([Time.zone.now, message].join(' '))
    end

    def info(message = nil)
      return if message.blank?
      custom_logger.info([Time.zone.now, message].join(' '))
    end

    def custom_logger
      @custom_logger ||= ActiveSupport::Logger.new(File.join(Rails.root, 'log', "#{log_file}.log"), 10, 50_000_000)
    end
  end

  class CdVisitorKeyMissing < StandardError
  end
end
