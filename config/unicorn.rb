rails_env = ENV['RACK_ENV'] || ENV['RAILS_ENV']
app_path = '/home/ubuntu/www/getonstage'
app_root = "#{app_path}/current"

Dir.chdir(Unicorn::HttpServer::START_CTX[:cwd] = app_root)
working_directory app_root

Unicorn::HttpServer::START_CTX[0] = "#{app_root}/bin/unicorn"
pid_file = "#{app_root}/tmp/pids/getonstage.pid"
stderr_path  "#{app_path}/shared/log/getonstage.log"
stdout_path  "#{app_path}/shared/log/getonstage.log"
old_pid = pid_file + '.oldbin'

pid pid_file
if rails_env == 'production'
  listen '8080'
else
  listen '/tmp/getonstage.sock'
end
worker_processes \
  (ENV['RACK_ENV'] || ENV['RAILS_ENV']) == 'production' ? 4 : 1
preload_app true
timeout 3000

before_exec do |_server|
  ENV['BUNDLE_GEMFILE'] = "#{app_root}/Gemfile"
end

before_fork do |server, worker|
  ActiveRecord::Base.connection.disconnect! if defined?(ActiveRecord::Base)

  old_pid = "#{server.config[:pid]}.oldbin"
  if old_pid != server.pid
    begin
      sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
      Process.kill(sig, File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH => e
      puts e
    end
  end

  # Throttle the master from forking too quickly by sleeping.
  sleep 1
end

after_fork do |_server, worker|
  # the following is *required* for Rails + "preload_app true",
  ActiveRecord::Base.establish_connection if defined?(ActiveRecord::Base)

  # if preload_app is true, then you may also want to check and
  # restart any other shared sockets/descriptors such as Memcached,
  # and Redis. TokyoCabinet file handles are safe to reuse
  # between any number of forked children (assuming your kernel
  # correctly implements pread()/pwrite() system calls)

  begin
    uid = Process.euid
    gid = Process.egid
    user = 'ubuntu'
    group = 'ubuntu'
    target_uid = Etc.getpwnam(user).uid
    target_gid = Etc.getgrnam(group).gid
    worker.tmp.chown(target_uid, target_gid)
    if uid != target_uid || gid != target_gid
      Process.initgroups(user, target_gid)
      Process::GID.change_privilege(target_gid)
      Process::UID.change_privilege(target_uid)
    end
  rescue StandardError => e
    puts e
  end
end
