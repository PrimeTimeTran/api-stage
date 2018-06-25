# frozen_string_literal: true

class UserBuilder
  attr_reader :user

  def initialize(email, password)
    @user = User.new
    @user.first_name = first_name
    @user.last_name = last_name
    @user.email = email
    @user.city = city
    @user.country = country
    @user.occupation = occupation
    @user.description = description
    @user.password = password
    @user.phone_number = phone_number
    @user.age = 18
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

  def city
    Faker::Address.city
  end

  def country
    Faker::Address.country
  end

  def occupation
    Faker::Company.profession.capitalize
  end

  def description
    Faker::Lorem.sentence(3)
  end

  def phone_number
    Faker::PhoneNumber.cell_phone
  end
end
