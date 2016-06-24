require "sinatra"
require "sinatra/reloader"
load "lib/TodoList"
enable(:sessions)


get "/" do
  if session[:status] == "in"
    redirect to "/home_page"
  else
    erb :log_in
  end
end

post "/caca_de_vaca" do
@username = params[:username]
@password = params[:password]
session[:status] = T.new(@username,@password).authen
session[:username] = @username
session[:password] = @password
  if T.new(@username,@password).authen == "in"
    redirect to "/home_page"
  else
    redirect to "/"
  end

end

get "/home_page" do
  if session[:status] == "in"
    @username_home_page = session[:username]
    erb :home_page
  else
    redirect to "/"
  end

end

post "/home_page" do
  session[:status] = ""
  session[:username] = ""
  session[:password] = ""
  redirect to "/"
end
