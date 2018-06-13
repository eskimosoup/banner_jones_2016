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
    CustomLogger.fatal(e.message)
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
    "Subject\n#{[object.class.model_name.human.titleize, 'submission'].join(' ')}\n\n"
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
    require 'net/http'
    require 'uri'

    URL = URI('http://analytics-eu.clickdimensions.com/forms/h/aPbb09lIdt0mVE5hnWx0QA')
    # URL = 'http://192.168.0.26:3000'

    def initialize(hash, referer)
      @hash = hash
      @referer = referer
    end

    def call
      post_action
    end

    private

    attr_reader :hash, :referer

    def post_action
      req = post_request
      req.set_form_data(hash)
      Net::HTTP.start(URL.host, URL.port) { |http| http.request(req) }
    rescue Net::HTTPSuccess, Net::HTTPRedirection => e
      post_callback(e)
    rescue Timeout::Error, Errno::EINVAL, Errno::ECONNRESET, EOFError,
           Net::HTTPBadResponse, Net::HTTPHeaderSyntaxError, Net::ProtocolError => e
      CustomLogger.fatal(e.to_yaml)
    end

    def post_request
      Net::HTTP::Post.new(URL, headers)
    end

    def post_callback(exception)
      header = exception.header.to_hash
      if header.include?('location') &&
         header['location'].include?('form-success')
        CustomLogger.info('Successful submission')
      else
        CustomLogger.fatal(exception.to_yaml)
      end
    rescue StandardError => e
      CustomLogger.fatal(e)
    end

    def headers
      {
        'Referer' => referer,
        'Content-Type' => 'application/x-www-form-urlencoded',
        'Charset' => 'UTF-8'
      }
    end
  end

  class CdVisitorKeyMissing < StandardError
  end
end
