# frozen_string_literal: true

class JsonWebToken
  HMAC_SECRET = Rails.application.secrets.secret_key_base

  def self.encode(payload, exp = 1.year.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, HMAC_SECRET, 'HS512')
  end

  def self.decode(token)
    body = JWT.decode(token, HMAC_SECRET, true, algorithm: 'HS512')[0]
    HashWithIndifferentAccess.new body
  rescue JWT::DecodeError => e
    raise ExceptionHandler::InvalidToken, e.message
  end
end
