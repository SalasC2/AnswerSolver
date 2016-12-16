get '/users/new' do
  @user = User.new
  erb :'/users/new.html'
end

post '/users' do
  @user = User.new(params[:user])
  @user.password = params[:user][:password]

  if @user.valid? && @user.password != nil
    @user.save
    login(@user)
    redirect "/users/#{@user.id}/profile/"
  else
    @password_error = 'Password can`t be blank!'
    status 422
    @errors = @user.errors.full_messages
    erb :'/users/new.html'
  end
end

get '/users/:id/profile' do
  @user = User.find(params[:id])
  erb :"users/show.html"
end
