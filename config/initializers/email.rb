if Rails.env.to_s != 'development'
  ActionMailer::Base.smtp_settings = {
    address: 'smtp.mailgun.org',
    port: 587,
    domain: ENV['MAILGUN_DOMAIN'],
    user_name: ENV['MAILGUN_USERNAME'],
    password: ENV['MAILGUN_PASSWORD'],
    authentication: 'plain'
  }
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.default charset: 'utf-8'
end
