# encoding: utf-8

require "sinatra"
require "sinatra/activerecord"
$LOAD_PATH.unshift(File.dirname(__FILE__))

# require model
Dir[File.dirname(__FILE__) + '/model/*.rb'].each {|file| require file }
# require helper
Dir[File.dirname(__FILE__) + '/helper/*.rb'].each {|file| require file }
helpers AppHelper, ResponseHelper
# require controller
Dir[File.dirname(__FILE__) + '/controller/*.rb'].each {|file| require file }

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