# https://stackoverflow.com/questions/9569070/how-to-enter-rails-console-on-production-via-capistrano
# https://gist.github.com/joost/9343156
namespace :rails do
  desc 'Open a rails console `cap [staging] rails:console [server_index default: 0]`'
  task :console do
    server = roles(:app)[ARGV[2].to_i]

    puts "rails c #{fetch(:rails_env)} for #{fetch(:application)} on '#{server.user}@#{server.hostname}'"

    on roles :app do
      current = "cd #{fetch(:deploy_to)}/current"
      bundle_exec = "#{fetch(:rbenv_prefix)} bundle exec rails console -e #{fetch(:rails_env)}"
      ssh = "ssh #{server.user}@#{server.hostname} -t '#{current} && #{bundle_exec}'"
      exec ssh
    end
  end
end
