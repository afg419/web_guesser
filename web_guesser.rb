require 'sinatra'
require 'sinatra/reloader'

n = rand(100)

get '/' do
  erb :index, :locals => {:n => n}
end
