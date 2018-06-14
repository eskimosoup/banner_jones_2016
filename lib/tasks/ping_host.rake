# frozen_string_literal: true

namespace :ping_host do
  desc 'Send a HEAD request to preload the applciation'
  task request: :environment do
    require 'net/http'
    include Rails.application.routes.url_helpers
    url = URI(root_url)
    Net::HTTP.start(url.host, url.port, read_timeout: 10) do |http|
      response = http.head('/', 'User-Agent' => 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:21.0) Gecko/20100101 Firefox/21.0')
      puts [url, response.code].join(' ')
    end
  rescue StandardError => e
    puts e
  end
end
