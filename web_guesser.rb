require 'sinatra'
require 'sinatra/reloader'

secret_number ||= rand(100)

get '/' do
  p "Try your luck!"
  p "The secret number is #{secret_number}"  
end