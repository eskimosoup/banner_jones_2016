# frozen_string_literal: true

namespace :error_handling do
  task :generate_static_pages do
    on roles(:web) do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rails,
                  :runner,
                  '"ErrorHandlingService.generate_static_pages(ActionMailer::Base.asset_host)"'
        end
      end
    end
  end
end

after 'deploy:published', 'error_handling:generate_static_pages'
