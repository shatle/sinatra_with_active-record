# encoding: utf-8

require "sinatra"
require "sinatra/activerecord"

set :database_file, 'database.yml'

configure do 
  mime_type :json, 'application/json'
end

# === Model
class User < ActiveRecord::Base
  has_many :teams_users
  has_many :teams, :through => :teams_users

  validates_presence_of :name
end

class Team < ActiveRecord::Base
  has_many :teams_users
  has_many :users, :through => :teams_users

  validates_presence_of :name
end

class TeamsUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :team
end

# === Fitler
before do
   content_type :json 
end
after do 
  # puts "response, #{response.status}"
end

# === API
get '/' do 
  {:a => 1}.to_json
end

get '/users' do 
  User.all.to_json
end

get '/users/create' do 
  User.create(params).to_json
end