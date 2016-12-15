get '/login' do
  erb :'/sessions/new'
end

post '/login' do
  @user = User.unlock(params[:user][:username], params[:user][:password])

  if @user && @user.password == params[:user][:password]
    login(@user)
    # route
    erb :index
  else
    status 422
    @login_error = 'Username and Password does NOT match !'
    erb :'/sessions/new'
  end

end

delete '/logout' do
  logout
  # route
  erb :index
end
