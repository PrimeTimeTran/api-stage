# frozen_string_literal: true

class Info
  def self.not_found(record = 'record')
    "Sorry, #{record} not found."
  end

  def self.invalid_password
    'Invalid password'
  end

  def self.invalid_token
    'Invalid token'
  end

  def self.missing_token
    'Missing token'
  end

  def self.unauthorized
    'Unauthorized request'
  end

  def self.account_created
    'Account created successfully'
  end

  def self.account_not_created
    'Account could not be created'
  end

  def self.expired_token
    'Sorry, your token has expired. Please login to continue.'
  end
end
