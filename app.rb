# encoding: utf-8

require "sinatra"
require "sinatra/activerecord"
$LOAD_PATH.unshift(File.dirname(__FILE__))

# require model
Dir[File.dirname(__FILE__) + '/model/*.rb'].each {|file| require file }
# require helper
Dir[File.dirname(__FILE__) + '/helper/*.rb'].each {|file| require file }
# require controller
Dir[File.dirname(__FILE__) + '/controller/*.rb'].each {|file| require file }

class App < Sinatra::Application
  include ResponseHelper
  helpers AppHelper

  configure do 
    mime_type :json, 'application/json'
  end
  set :database_file, 'database.yml'

  # === Fitler
  before do
     content_type :json 
  end
  after do 
    # puts "response, #{response.status}"
  end

  run! if app_file == $0
end