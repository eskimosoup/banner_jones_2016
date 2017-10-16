# https://github.com/capistrano-plugins/capistrano-rbenv-install
# https://github.com/mhutter/capistrano-recipes
namespace :rbenv do
  desc 'Install rbenv and bundler'

  task :install_rbenv do
    on roles fetch(:rbenv_roles) do
      fetch(:rbenv_path)
      next if test "[ -d #{fetch(:rbenv_path)} ]"
      execute :git,
              :clone,
              'https://github.com/rbenv/rbenv.git',
              fetch(:rbenv_path)
    end
  end

  task :install_ruby_build do
    on roles fetch(:rbenv_roles) do
      rbenv_ruby_build_path = "#{fetch(:rbenv_path)}/plugins/ruby-build"
      next if test "[ -d #{rbenv_ruby_build_path} ]"
      execute :git,
              :clone,
              'https://github.com/sstephenson/ruby-build.git',
              rbenv_ruby_build_path
    end
  end

  task :update_ruby_build do
    on roles fetch(:rbenv_roles) do
      rbenv_ruby_build_path = "#{fetch(:rbenv_path)}/plugins/ruby-build"
      next unless test "[ -d #{rbenv_ruby_build_path} ]"
      within rbenv_ruby_build_path do
        execute :git, :pull
      end
    end
  end

  task :install_ruby do
    on roles fetch(:rbenv_roles) do
      next if test "[ -d #{fetch(:rbenv_ruby_dir)} ]"
      rbenv_bin_executable_path = "#{fetch(:rbenv_path)}/bin/rbenv"
      invoke 'rbenv:update_ruby_build'
      execute rbenv_bin_executable_path, :install, fetch(:rbenv_ruby)
    end
  end

  task install_bundler: ['rbenv:map_bins'] do
    on roles fetch(:rbenv_roles) do
      rbenv_bin_executable_path = "#{fetch(:rbenv_path)}/bin/rbenv"
      execute rbenv_bin_executable_path,
              :exec,
              'gem install bundler --no-rdoc --no-ri'
      execute rbenv_bin_executable_path, :rehash
    end
  end

  task :install do
    invoke 'rbenv:install_rbenv'
    invoke 'rbenv:install_ruby_build'
    invoke 'rbenv:install_ruby'
  end

  before 'rbenv:validate', 'rbenv:install'
  before 'bundler:install', 'rbenv:install_bundler'
end
