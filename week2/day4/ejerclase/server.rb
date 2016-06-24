require "sinatra"
require "sinatra/reloader"

get "/" do
  erb :home
end

get "/come_back" do
  redirect "/"
end
