get '/users' do 
  User.all.to_json
end

get '/users/create' do 
  User.register(params).to_json
end