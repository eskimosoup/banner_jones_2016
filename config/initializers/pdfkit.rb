PDFKit.configure do |config|
  config.wkhtmltopdf = Rails.env.production? ? '/usr/bin/wkhtmltopdf' : '/usr/local/bin/wkhtmltopdf'
  config.default_options[:quiet] = false
end
