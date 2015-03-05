# encoding: utf-8

require "sinatra"
require "sinatra/activerecord"

set :database_file, 'database.yml'

configure do 
  mime_type :json, 'application/json'
end

# === Model
# class GroupsUser < ActiveRecord::Base
#   belongs_to :user
#   belongs_to :group
# end

# class User < ActiveRecord::Base
#   has_many :groups_users
#   has_many :groups, :through => :groups_users
# end

# class Group < ActiveRecord::Base
#   has_many :groups_users
#   has_many :users, :through => :groups_users
# end

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