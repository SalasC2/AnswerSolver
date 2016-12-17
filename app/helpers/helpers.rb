helpers do

  def login(user)
    session[:user_id] = user.id
  end

  def logout
    session.clear
    @current_user = nil
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      nil
    end
  end

end
