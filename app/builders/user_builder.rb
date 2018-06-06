# frozen_string_literal: true

class UserBuilder
  attr_reader :user

  def initialize(email, password)
    @user = User.new
    @user.email = email
    @user.password = password
    @user.first_name = first_name
    @user.last_name = last_name
    @user.save
    @user
  end

  def user
    @user
  end

  private

  def first_name
    Faker::Name.first_name
  end

  def last_name
    Faker::Name.last_name
  end
end
