namespace :logs do
  desc 'tail rails logs'
  task :env do
    on roles(:app) do
      execute "tail -f #{shared_path}/log/#{fetch(:rails_env)}.log"
    end
  end

  desc 'tail custom log'
  task :file do
    on roles(:app) do
      ask(:filename, 'without .log')
      execute "tail -f #{shared_path}/log/#{fetch(:filename)}.log"
    end
  end
end
