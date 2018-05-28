class UserDecorator < Draper::Decorator
  delegate_all

  def full_name
    return object.first_name + ' ' + object.last_name if object.first_name && object.last_name
    ''
  end
end
