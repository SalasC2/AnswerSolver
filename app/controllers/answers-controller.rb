# get '/questions/:question_id/answers' do
#
#   @question = Question.find(params[:question_id])
#
#   @answers = @question.answers
#
#   erb :'answers/index'
#
# end
#
get '/questions/:question_id/answers/new' do

  @question = Question.find(params[:question_id])

  erb :'answers/_new.html'

end

post '/questions/:question_id/answers' do

  @question = Question.find(params[:question_id])

  @answer = @question.answers.new(params[:answer])
  @answer.user = current_user

  if @answer.save
    redirect "/questions/#{@question.id}"
  else
    erb :'answers/_new.html' #show new answers view again(potentially displaying errors)
  end

end

get '/questions/:question_id/answers/:id' do

  @question = Question.find(params[:question_id])

  @answer = @question.answers.find(params[:id])

  erb :'answers/_show.html'

end

get '/questions/:question_id/answers/:id/edit' do

  @question = Question.find(params[:question_id])

  @answer = @question.answers.find(params[:id])

  if request.xhr?
    erb :'answers/_edit.html', layout: false
  else
    erb :'answers/edit.html'
  end

end

put '/questions/:question_id/answers/:id' do

  @question = Question.find(params[:question_id])

  @answer = @question.answers.find(params[:id])

  if request.xhr?
    if @answer.update_attributes(params[:answer])
      erb :"/answers/_show.html", layout: false
    else
      erb :'answers/_edit.html' #show edit answers view again(potentially displaying errors)
    end
  else
     "No no"
  end

end

delete '/questions/:question_id/answers/:id' do

  @question = Question.find(params[:question_id])

  @answer = @question.answers.find(params[:id])

  @answer.destroy

  redirect "/questions/#{@question.id}"

end
