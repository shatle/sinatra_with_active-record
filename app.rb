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

configure do 
  mime_type :json, 'application/json'
end
set :database_file, 'database.yml'

class App < Sinatra::Base
  enable :logging

  include ResponseHelper
  helpers AppHelper
  
  # === Fitler
  before do
     content_type :json 
  end
  after do 
    # puts "response, #{response.status}"
  end

  # === API
  get '/' do 
    RESPONSE_CODE::RECORD_NOT_FOUND.to_json
    # "#{request.env['REMOTE_ADDR']},,, #{request.ip}"
  end

  run! if app_file == $0
end