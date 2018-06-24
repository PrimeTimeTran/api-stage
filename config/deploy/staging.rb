set :stage, :staging
set :branch, 'master'
set :rbenv_ruby, '2.5.1'
# used in case we're deploying multiple versions of the same
# app side by side. Also provides quick sanity checks when looking
# at filepaths
set :full_app_name, "#{fetch(:application)}_#{fetch(:stage)}"
set :server_name, 'staging.getonstageapp.com'

server '35.198.200.141',
       user: 'ubuntu', roles: %w[web app db], primary: true

set :deploy_to,
    "/home/#{fetch(:deploy_user)}/www/#{fetch(:application)}/rails"

# dont try and infer something as important as environment from
# stage name.
set :rails_env, :staging

# whether we're using ssl or not, used for building nginx
# config file
set :enable_ssl, false
