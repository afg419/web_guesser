require 'sinatra'
require 'sinatra/reloader'

n = rand(100)
m = "Let's play!"
g = "awaiting first guess"

get '/' do
  if params["guess"]
    g = params["guess"].to_i
    m = "Too High!" if g > n
  end
  erb :index, :locals => {:n => n, :m => m, :g => g}
end



# if the guess is too high
#   set the message to "Too high!"
# end
# render the ERB template and pass in the number AND the message
