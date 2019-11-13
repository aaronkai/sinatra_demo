require 'sinatra'
require 'sinatra/reloader'

@@secret_number ||= rand(100)
background_color = 'white'
@@guesses = 5
message = "Try to Guess the Number"

get '/' do
  guess = params["guess"]
  message = check_guess(guess)
  erb :index, :locals => {:secret_number => @@secret_number, 
                          :guess => guess,
                          :message => message,
                          :background_color => background_color(guess),
                          :guesses_remaining => @@guesses
                          }
end


def check_guess(guess)
  if @@guesses == 0
    message = "You ran out of guesses. Secret number was #{@@secret_number}. A new number has been generated."
    background_color = 'white'
    @@guesses = 5
    @@secret_number = rand(100)
    
  else
    if guess.to_i > @@secret_number
      message = "Too High!"
      @@guesses -= 1
    elsif guess.to_i < @@secret_number
      message = "Too Low!"
      @@guesses -= 1
    else
      message = "You Got It Right!"
      @@guesses = 5
      @@secret_number = rand(100)
    end
  end
    return message
end

def background_color(guess)
  difference = (guess.to_i - @@secret_number).abs
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

