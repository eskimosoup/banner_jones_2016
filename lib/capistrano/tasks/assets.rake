# frozen_string_literal: true

# https://gist.github.com/twetzel/66de336327f79beac0e0#gistcomment-1787791
# https://gist.github.com/dsandstrom/4e6d118b4ca22e0fc7d40d40c5a8f22d
# https://gist.github.com/Mavvie/90bc453d29c46cfd3db0105d0f7d4c9b
# https://stackoverflow.com/a/45236293
# https://github.com/capistrano/rails/blob/660e9ba03d161b93d5fb00537de1a8158bb9a44d/lib/capistrano/tasks/assets.rake#L122
Rake::Task['deploy:compile_assets'].clear
Rake::Task['deploy:set_linked_dirs'].clear

namespace :deploy do
  desc 'Compile assets'
  task compile_assets: [:set_rails_env] do
    # invoke 'deploy:assets:precompile'
    invoke 'deploy:assets:precompile_local'
    invoke 'deploy:assets:backup_manifest'
  end

  namespace :assets do
    desc 'Precompile assets locally and then rsync to web servers'
    task :precompile_local do
      dirs = ['./public/assets/', './public/packs/']

      # compile assets locally
      run_locally do
        # execute 'RAILS_ENV=production bundle exec rake assets:precompile'
        execute "RAILS_ENV=#{fetch(:stage)} bundle exec rake assets:precompile"

        dirs.each do |directory|
          next unless File.directory?(directory)
          execute "find #{directory} -type f -name '*.jpg' -exec jpegoptim -m70 --strip-all --all-progressive --force {} \\;"
          execute "find #{directory} -type f -name '*.JPG' -exec jpegoptim -m70 --strip-all --all-progressive --force {} \\;"
          execute "find #{directory} -type f -name '*.png' -exec optipng -quiet -strip all -o7 {} \\;"
          execute "find #{directory} -type f -name '*.PNG' -exec optipng -quiet -strip all -o7 {} \\;"
        end
      end

      # rsync to each server
      on roles(fetch(:assets_roles, [:web])), in: :parallel do
        # this needs to be done outside run_locally in order for host to exist
        path = "#{host.user}@#{host.hostname}:#{release_path}"
        dirs.each do |directory|
          run_locally do
            execute :rsync,
                    "-a --delete #{directory} #{path}#{directory[1..-1]}"
          end
        end
      end

      # clean up
      run_locally do
        dirs.each do |local|
          execute :rm,
                  "-rf #{local}"
        end
      end
    end
  end
end
