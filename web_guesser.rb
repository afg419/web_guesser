require 'sinatra'
require 'sinatra/reloader'

n = rand(100)
m = "Let's play!"
g = "awaiting first guess"

def cond_hash
  {
    -1 => {true => "Way too low!", false => "Close, but too low!"},
    0 => {false => "Nailed it!"},
    1 => {true => "Way too high!", false => "Close, but too high!"}
  }
end

get '/' do
  if params["guess"]
    g = params["guess"].to_i
    m = cond_hash[g <=> n][g < n ? g < n - 5 : g > n + 5]
  end
  erb :index, :locals => {:n => n, :m => m, :g => g}
end



# if the guess is too high
#   set the message to "Too high!"
# end
# render the ERB template and pass in the number AND the message
