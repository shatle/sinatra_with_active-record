# encoding: utf-8
class Team < ActiveRecord::Base
  belongs_to :user
  has_many :teams_users
  has_many :users, :through => :teams_users

  validates_presence_of :name
end