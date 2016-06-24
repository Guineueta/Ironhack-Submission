require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/flash'
require './lib/Passwordchecker.rb'
require 'pry'


enable :sessions

get '/' do
  erb :home
end



post '/login' do
  @email = params[:name]
  @password = params[:password]
  # binding.pry
  subject = Passwordchecker.new(@email, @password)
  session[:authorized] = subject.validate
  if session[:authorized] == true
    redirect to '/profile'
  else
    redirect to '/error'
  end
end


# post '/signup' do
#   login.signup
#   redirect to '/'
# end

post '/logout' do
    session[:authorized] = false
    redirect to '/'
end

get '/profile' do
  if session[:authorized]
    erb :profile
  else
    redirect to '/'
  end
end

get '/error' do
  erb :error
end


# get '/result' do
#   @result = session[:result]
#   erb :result
# end
# #
#
# post '/save_result' do
#   @saved_results = YAML::Store.new("results.yml")
#   save_result = params[:save_result]
#   if save_result == "save"
#     save(session[:result])
#   end
#   redirect to '/saved'
# end
