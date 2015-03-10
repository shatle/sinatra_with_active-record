class App < Sinatra::Application
  get '/' do 
    RESPONSE_CODE::RECORD_NOT_FOUND.to_json
    # "#{request.env['REMOTE_ADDR']},,, #{request.ip}"
  end
end