# encoding: utf-8
require 'bcrypt'
class User < ActiveRecord::Base
  has_many :teams_users
  has_many :teams, :through => :teams_users

  validates_presence_of :name, :email, :pwd
  validates_uniqueness_of :name, :email
  validates_length_of :name, :in => 3..30
  validates_format_of :name, :with => /\A[A-Za-z0-9]+\z/i
  validates_format_of :email, :with =>  /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/i

  # 
  # Class Methods
  # 

  def self.register(name, email, pwd, confirm_pwd)
    return RESPONSE_CODE::PWD_ILLEGAL if pwd != confirm_pwd
    salt = User.gen_salt
    user = User.create({name: name, email: email, salt: salt, pwd: User.gen_encrypted_pwd(pwd, salt) })
    return RESPONSE_CODE::PARAMS_ILLEGAL unless user.valid?
    user
  end

  def self.gen_salt
    BCrypt::Engine.generate_salt
  end

  def self.gen_encrypted_pwd(password, salt)
    BCrypt::Engine.hash_secret(password, salt)
  end

  def self.login(login_name, pwd)

  end

  # 
  # Private
  # 
  private 
end