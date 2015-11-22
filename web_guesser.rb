require 'sinatra'
require 'sinatra/reloader'

@@guesses = 0

@@secret = rand(10)
m = "Let's play!"
g = "awaiting first guess"

def cond_hash
  {
    true => {true => "Way too low!", false => "Close, but too low!"},
    false => {true => "Way too high!", false => "Close, but too high!"}
  }
end

def check_guess(guess)
  unless guess.nil?
    cond_hash[guess < @@secret][guess < @@secret ? guess < @@secret - 5 : guess > @@secret + 5]
  else
    "Let's play!"
  end
end

def restart
  @@secret = rand(10)
  @@guesses = 0
end

get '/' do
    g = params["guess"]
    c = params["cheat"]
    g = g.to_i unless g.nil?
    @@guesses += 1 unless g.nil?
    m = check_guess(g)
    if @@secret == g
      m = "You win!!! We've RESET the number"
      restart
    elsif @@guesses > 4
      m = "You lose!!! We've RESET the number"
      restart
    end
    erb :index, :locals => {:n => @@secret, :m => m, :g => g, :c => c, :t => @@guesses}
end



# if the guess is too high
#   set the message to "Too high!"
# end
# render the ERB template and pass in the number AND the message
