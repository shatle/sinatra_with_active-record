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

  def self.gen_token
    SecureRandom.urlsafe_base64(16)
  end

  def self.login(login_name, pwd)
    # should add table index: name, email
    user = User.where({:email => login_name}).first if login_name.include? '@'
    user ||= User.where({:name => login_name}).first
    return RESPONSE_CODE::LOGIN_ERROR if !user || user.pwd != User.gen_encrypted_pwd(pwd, user.salt)
    return user.reload if user.update_attributes({:token=>User.gen_token, :expired=> Time.now+10.minutes })
    return RESPONSE_CODE::LOGIN_ERROR
  end

  def self.auth(token)
    # should add table index: token
    user = User.find_by_token(token) 
    return RESPONSE_CODE::AUTH_ERROR unless user 
    return RESPONSE_CODE::AUTH_EXPIRED_ERROR if user.expired < Time.now
    user
  end

  # 
  # Private
  # 
  private 
end