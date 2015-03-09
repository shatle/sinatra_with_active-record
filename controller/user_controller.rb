get '/users' do 
  User.all.to_json
end

get '/users/create' do 
  User.register(params[:name], params[:email], params[:pwd], params[:confirm_pwd]).to_json({
      :only => [:name, :email, :token]
    })
end

get '/users/:id' do 
  u = User.find_by_id(params[:id])
  return RESPONSE_CODE::RECORD_NOT_FOUND.to_json unless u 
  u.to_json
end