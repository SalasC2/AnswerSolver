get '/users/new' do
  @user = User.new # !!!
  erb :'/users/new'
end

post '/users/new' do
  @user = User.new(params[:user])
  @user.password = params[:user][:password]

  if @user.valid? && @user.password != nil
    @user.save
    login(@user)
    erb :index
    # route
    else
      @password_error = 'Password can`t be blank !'
      status 422
      @errors = @user.errors.full_messages
      erb :'/users/new'
  end


end
