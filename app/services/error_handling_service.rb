class ErrorHandlingService
  def self.generate_static_pages(host)
    Thread.new do
      exit if host.blank?
      %w[500].each do |code|
        uri = URI([host, code].join('/'))
        response = Net::HTTP.get_response(uri)
        file_name = [code, '.html'].join
        file = ['public', file_name].join('/')
        IO.write(file, response.body) # if response.code == code
      end
    end
  rescue => e
    puts e
  end
end
