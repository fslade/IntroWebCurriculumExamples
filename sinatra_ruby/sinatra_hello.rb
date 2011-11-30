require 'rubygems'
require 'sinatra'

# Hello World
get '/' do
  "Welcome to <i>Sinatra</i>"
end
# * * * * * * * * *

# Profile
get '/profile' do
  name = params[:name]
  if name.length % 2 == 0
    img = "ballerina.jpg"
  else
    img = "dragon.gif"
  end
  erb :profile, :locals => {
    :name => name.capitalize,
    :img => img}
end
# * * * * * * * * *

# Quiz
$questions = [
              ["How many months in a year?", "12"],
              ["What kind of animal has a trunk?", "elephant"],
              ["How old do you have to be to vote in America?", "18"]
             ]
$score = 0

get '/quiz' do
  q_num = rand($questions.length)
  erb:quiz, :locals => {:question => $questions[q_num][0], :q_num => q_num}
end

post '/quiz/:num' do
  num = params[:num].to_i
  correct = (params[:message] == $questions[num][1])
  if correct
    $score += 1
  end
  erb:answer, :locals => {
    :answer => $questions[num][1],
    :correct => correct,
    :score => $score }
end
# * * * * * * * * *
