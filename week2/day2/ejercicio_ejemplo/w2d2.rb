require "sinatra"
require "sinatra/reloader"


get "/" do
"this is my app"
end


get "/about" do
  erb :about
end


get "/hi" do
  @name = "Mike"
  erb :hi
end

get "/time" do
  @time = Time.now
  erb :time
end

get "/fruits" do
  @fruits = %w(oranges manzana pera)
  erb :fruits
end

get "/users/:username" do
  @username = params[:username]
  erb :user
end

get "/hours/:h" do
  @h = params[:h]
  @time = Time.now - (60 * 60 * @h.to_i)
  erb :hours

end
