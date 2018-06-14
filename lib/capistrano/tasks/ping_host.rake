# frozen_string_literal: true

# Send HEAD request to host to pre-load app for quick visiting
namespace :preload do
  task :ping_host do
    on roles(:web) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rails,
                  :runner,
                  '"Rails.application.routes.default_url_options.all? {|s| hash.key? s}[:host].present? ? exec(\"wget --spider --tries 1 --timeout=30 --no-verbose --user-agent=\'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8; rv:21.0) Gecko/20100101 Firefox/21.0\' -O /dev/null #{Rails.application.routes.default_url_options[:host]}\") : puts(\"Rails.application.routes.default_url_options[:host] is missing\")"'
        end
      end
    end
  end
end

after 'deploy:published', 'preload:ping_host'
