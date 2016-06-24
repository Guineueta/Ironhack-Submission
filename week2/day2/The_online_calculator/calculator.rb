require "sinatra"
require "sinatra/reloader"
load "lib/calcul.rb"

get "/calculator" do
erb :calculator
end

post "/calculate" do
  @first = params[:first_number].to_f
  @second = params[:second_number].to_f
  @operation = params[:operation]
  @result = Calculator.new(@first,@second,@operation).do_operation
  IO.
  erb :result
end
