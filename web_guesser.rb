require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(10)
m = "Let's play!"
g = "awaiting first guess"

def cond_hash
  {
    -1 => {true => "Way too low!", false => "Close, but too low!"},
    0 => {false => "Nailed it!"},
    1 => {true => "Way too high!", false => "Close, but too high!"}
  }
end

def check_guess(guess)
  unless guess.nil?
    cond_hash[guess <=> SECRET_NUMBER][guess < SECRET_NUMBER ? guess < SECRET_NUMBER - 5 : guess > SECRET_NUMBER + 5]
  else
    "Let's play!"
  end
end

get '/' do
    g = params["guess"]
    c = params["cheat"]
    g = g.to_i unless g.nil?
    m = check_guess(g)
    erb :index, :locals => {:n => SECRET_NUMBER, :m => m, :g => g, :c => c}
end



# if the guess is too high
#   set the message to "Too high!"
# end
# render the ERB template and pass in the number AND the message
