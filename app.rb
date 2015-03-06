# encoding: utf-8

require "sinatra"
require "sinatra/activerecord"
$LOAD_PATH.unshift(File.dirname(__FILE__))

# require model
Dir[File.dirname(__FILE__) + '/model/*.rb'].each {|file| require file }
# require helper
Dir[File.dirname(__FILE__) + '/helper/*.rb'].each {|file| require file }
helpers AppHelper
# 

set :database_file, 'database.yml'
configure do 
  mime_type :json, 'application/json'
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
  printTestJson
end

get '/users' do 
  User.all.to_json
end

get '/users/create' do 
  User.create(params).to_json
end