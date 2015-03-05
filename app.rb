# encoding: utf-8

require "sinatra"
require "sinatra/activerecord"

set :database_file, 'database.yml'

configure do 
  mime_type :json, 'application/json'
end

# === Model
class TeamsUser < ActiveRecord::Base
  belongs_to :user
  belongs_to :team
end

class User < ActiveRecord::Base
  has_many :teams_users
  has_many :teams, :through => :teams_users
end

class Team < ActiveRecord::Base
  has_many :teams_users
  has_many :users, :through => :teams_users
end

# === Fitler
before do
   content_type :json 
end
after do 
  puts "response, #{response.status}"
end

# === API
get '/' do 
  {:a => 1, :b => { :c => 3 }}.to_json
end