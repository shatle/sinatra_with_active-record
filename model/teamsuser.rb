# encoding: utf-8
class TeamsUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :team
end