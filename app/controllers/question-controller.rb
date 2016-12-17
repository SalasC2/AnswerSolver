
get '/questions' do

  @questions = Question.all #define instance variable for view

  erb :'questions/index.html' #show all questions view (index)

end

get '/questions/new' do

  erb :'questions/new.html' #show new questions view

end

post '/questions' do

  #below works with properly formatted params in HTML form
  @question = Question.new(params[:question]) #create new question
  @question.user = current_user
  if @question.save #saves new question or returns false if unsuccessful
    redirect "/questions/#{@question.id}" #redirect back to questions index page
    p "it saved"
  else
    erb :'questions/new.html' # show new questions view again(potentially displaying errors)
  end

end

get '/questions/:id' do

  #gets params from url
  p current_user

  @question = Question.find(params[:id]) #define instance variable for view

  erb :'questions/show.html' #show single question view

end

get '/questions/:id/edit' do

  #get params from url
  @question = Question.find(params[:id]) #define intstance variable for view

  erb :'questions/edit.html' #show edit question view

end

put '/questions/:id' do

  #get params from url
  @question = Question.find(params[:id]) #define variable to edit

  @question.assign_attributes(params[:question]) #assign new attributes

  if @question.save #saves new question or returns false if unsuccessful
    redirect '/questions' #redirect back to questions index page
  else
    erb :'questions/edit' #show edit question view again(potentially displaying errors)
  end

end

delete '/questions/:id' do

  #get params from url
  @question = Question.find(params[:id]) #define question to delete

  @question.destroy #delete question

  redirect '/questions' #redirect back to questions index page

end
