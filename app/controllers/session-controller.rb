get '/login' do
  erb :'/users/login.html'
end

post '/login' do
  @user = User.find_by(username: params[:username])

  if @user.password == params[:password]
    login(@user)
    redirect "/users/#{@user.id}/profile"
  else
    status 422
    @login_error = 'Username and Password does NOT match!'
    redirect '/login'
  end
end

delete '/logout' do
  logout
  redirect '/'
end
