# encoding: utf-8
class User < ActiveRecord::Base
  has_many :teams_users
  has_many :teams, :through => :teams_users

  validates_presence_of :name
end