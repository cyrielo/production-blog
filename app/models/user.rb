require 'bcrypt'

class User < ApplicationRecord
  validates :email, :username, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :email, :password, presence: true
  validates :password, length: { minimum: 6 }
  validates :first_name, :last_name, :username, presence: true, on: :create

  before_create :hash_password

  SALT = 'Tk@M#F!fq9$cv^X&)+'

  def hash_password
    password_salted = "#{SALT}#{self.password}"
    password_hash = BCrypt::Password.create(password_salted)
    self.password = password_hash
  end

end
