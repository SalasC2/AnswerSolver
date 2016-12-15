helpers do

  def login(user)
    session[:user_id] = user.id
  end

  def logout
    session.clear
    # or
    # session.delete(:user_id)
  end

  def current_user
    if session[:user_id]
      User.find(session[:user_id])
    else
      nil
    end
  end

end
