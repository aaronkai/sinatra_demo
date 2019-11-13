require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER ||= rand(100)

get '/' do
  guess = params["guess"]
  message = check_guess(guess)
  erb :index, :locals => {:secret_number => SECRET_NUMBER, :message => message} 
end


def check_guess(guess)
  if guess.to_i > SECRET_NUMBER
    message = "Too High!"
  elsif guess.to_i < SECRET_NUMBER
    message = "Too Low!"
  else
    message = "You Got It Right!"
  end
  return message
end