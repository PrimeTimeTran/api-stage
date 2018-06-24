# frozen_string_literal: true

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  # Run rails dev:cache to toggle caching.
  if Rails.root.join('tmp', 'caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Store uploaded files on the local file system (see config/storage.yml for options)
  config.active_storage.service = :local

  config.action_mailer.default_url_options = { host: 'localhost:3000' }

  # Jame's configuration to work locally
  # Rails.application.routes.default_url_options[:host] = '192.168.1.139:3000'

  # TODO: Make this configuration work. Doesn't fetch images with IP.
  # Rails.application.routes.default_url_options[:host] = '192.168.56.1:3000'

  # Loi's configuration to work locally
  # Rails.application.routes.default_url_options[:host] = 'localhost:3000'
  Rails.application.routes.default_url_options[:host] = '192.168.1.218:3000'

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = true

  config.action_mailer.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Highlight code that triggered database queries in logs.
  config.active_record.verbose_query_logs = true

  # Raises error for missing translations
  # config.action_view.raise_on_missing_translations = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker

  config.middleware.insert_before 0, Rack::Cors do
    allow do
      origins '*'
      resource '*', headers: :any, methods: %i[get post options delete]
    end
  end
end

module ShowWithRange
  def show
    if params[:content_type] == 'video/mp4'
      if key = decode_verified_key
        active_storage_disk_service =
          ActiveStorage::Service::DiskService.new(
            root: Rails.root.to_s + '/storage/'
          )
        path = active_storage_disk_service.send(:path_for, key)
        show_with_range(path)
      else
        head :not_found
      end
    else
      super
    end
  end

  def show_with_range(path)
    if File.exist?(path)
      file_size = File.size(path)
      begin_point = 0
      end_point = file_size - 1
      status = 200
      if request.headers['range']
        status = 206
        if request.headers['range'] =~ /bytes\=(\d+)\-(\d*)/
          begin_point = $1.to_i
          end_point = $2.to_i if $2.present?
        end
      end
      content_length = end_point - begin_point + 1
      response.header['Content-Range'] = "bytes #{begin_point}-#{end_point}/#{file_size}"
        response.header['Content-Length'] = content_length.to_s
        response.header['Accept-Ranges'] = 'bytes'
        send_data IO.binread(path, content_length, begin_point), :status => status
      else
        raise ActionController::MissingFile, "Cannot read file #{path}"
    end
  end
end

ActiveStorage::DiskController.class_eval do
  prepend ShowWithRange
end
