require 'sinatra'
require 'sinatra/reloader'

n = rand(20)

get '/' do
  "ThE SECRET number is #{n}"
end
