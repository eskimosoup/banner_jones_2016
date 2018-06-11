# frozen_string_literal: true

require 'singleton'
class CustomLogger < Logger
  include Singleton

  def initialize
    super(Rails.root.join('log/custom_loger.log'))
    self.formatter = formatter
    self
  end

  def formatter
    proc do |severity, time, _progname, msg|
      formatted_severity = format('%-5s', severity.to_s)
      formatted_time = time.strftime('%Y-%m-%d %H:%M:%S')
      "[#{formatted_severity} #{formatted_time} #{$PROCESS_ID}] #{msg.to_s.strip}\n"
    end
  end

  class << self
    delegate :error, :debug, :fatal, :info, :warn, :add, :log, to: :instance
  end
end
