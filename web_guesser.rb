require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER ||= rand(100)
background_color = 'white'

get '/' do
  guess = params["guess"]
  message = check_guess(guess)
  erb :index, :locals => {:secret_number => SECRET_NUMBER, 
                          :guess => guess,
                          :message => message,
                          :background_color => background_color(guess)} 
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

def background_color(guess)
  difference = (guess.to_i - SECRET_NUMBER).abs
  if difference > 10
    return "firebrick"
  elsif difference <= 10 && difference > 3
    return "pink"
  elsif difference <= 3 && difference > 0
    return 'paleGreen'
  elsif difference == 0
    return 'royalBlue'
  end
end