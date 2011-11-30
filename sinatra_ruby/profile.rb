require 'rubygems'
require 'sinatra'

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
