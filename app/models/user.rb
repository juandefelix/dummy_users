require 'bcrypt'
require 'pry'
class User < ActiveRecord::Base
  include BCrypt

  validates :email, uniqueness: true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

  def self.authenticate(email,password)
    user = self.where(email: email).first
    return user if user.password == password
    nil
  end

end
