module AppHelper

  def protected!
    unless current_user
      response['WWW-Authenticate'] = %(Basic realm="Testing HTTP Auth")
      throw(:halt, [401, "Not authorized\n"])
    end
  end

  def current_user
    @current_user ||=  User.auth(request.env)
  end

end