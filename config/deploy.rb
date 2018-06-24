set :application, 'getonstage'
set :deploy_user, 'ubuntu'

# setup repo details
# set :scm, :git
set :repo_url,
    'git@github.com:PrimeTimeTran/api-stage.git'

set :rbenv_prefix, %(RBENV_ROOT=#{fetch(:rbenv_path)}
RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec)
set :rbenv_map_bins,
    %w[rake gem bundle ruby rails unicorn unicornctl]

# how many old releases do we want to keep
set :keep_releases, 2
set :rbenv_ruby, '2.5.0'

# files we want symlinking to specific entries in shared.
set :linked_files, %w[config/database.yml .rbenv-vars]

set :pty, false
# dirs we want symlinking to shared
set :linked_dirs,
  %w[log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system storage]

# what specs should be run before deployment is allowed to
# continue, see lib/capistrano/tasks/run_tests.cap
set :tests, []
set :assets_roles, []

# which config files should be copied by deploy:setup_config
# see documentation in lib/capistrano/tasks/setup_config.cap
# for details of operations
set(
  :config_files,
  %w[
    nginx.conf
    database.example.yml
    log_rotation
    monit
    unicorn.rb
    unicorn_init.sh
  ]
)

# which config files should be made executable after copying
# by deploy:setup_config
set(
  :executable_config_files,
  %w[
    unicorn_init.sh
  ]
)

# files which need to be symlinked to other parts of the
# filesystem. For example nginx virtualhosts, log rotation
# init scripts etc.
set(
  :symlinks,
  [
    {
      source: 'nginx.conf',
      link: "/etc/nginx/sites-enabled/#{fetch(:full_app_name)}"
    },
    {
      source: 'unicorn_init.sh',
      link: "/etc/init.d/unicorn_#{fetch(:full_app_name)}"
    },
    {
      source: 'log_rotation',
      link: "/etc/logrotate.d/#{fetch(:full_app_name)}"
    },
    {
      source: 'monit',
      link: "/etc/monit/conf.d/#{fetch(:full_app_name)}.conf"
    }
  ]
)

namespace :unicorn do
  desc 'Create Directories for Puma Pids and Socket'
  task :start do
    on roles(:app) do
      within "#{current_path}" do
        execute :bundle, :exec, "unicorn -c config/unicorn.rb -D -E #{fetch(:rails_env)}"
      end
    end
  end

  task :restart do
    on roles(:app) do
      unicorn_pid = "#{shared_path}/tmp/pids/getonstage.pid"
      execute \
        execute "if [ -f #{unicorn_pid} ]; then kill -USR2 `cat #{unicorn_pid}`; fi"
    end
  end

  task :stop do
    on roles(:app) do
      unicorn_pid = "#{shared_path}/tmp/pids/getonstage.pid"
      execute \
        %(test -s "#{unicorn_pid}" && kill -QUIT `cat "#{unicorn_pid}"`)
    end
  end
end

namespace :deploy do
  after :finishing, 'deploy:cleanup'
  after 'deploy:publishing', 'deploy:restart'
  after 'deploy:restart', 'unicorn:restart'

  desc 'Make sure local git is in sync with remote.'
  task :check_revision do
    on roles(:app) do
      unless `git rev-parse HEAD` == `git rev-parse origin/master`
        puts 'WARNING: HEAD is not the same as origin/master'
        puts 'Run `git push` to sync changes.'
        exit
      end
    end
  end

  desc 'Initial Deploy'
  task :initial do
    on roles(:app) do
      before 'deploy:restart', 'unicorn:start'
      invoke 'deploy'
    end
  end

  # before :starting,     :check_revision
  after :finishing, :cleanup
end
