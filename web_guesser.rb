require 'sinatra'
require 'sinatra/reloader'

NUM = rand(100)

def check_guess(guess)
  if guess.to_i == NUM
    "... the RIGHT ONE! Congrats - it was #{NUM}"
  elsif guess.to_i < NUM - 5
    "way too low"
  elsif guess.to_i < NUM
    "too low"
  elsif guess.to_i > NUM + 5
    "way too high"
  else guess.to_i > NUM
    "too high"
  end
end

def color(guess)
  if guess.to_i == NUM
    "#00FF00"
  elsif guess.to_i < NUM - 5
    "#FF0000"
  elsif guess.to_i < NUM
    "#FF5721"
  elsif guess.to_i > NUM + 5
    "#FF0000"
  else guess.to_i > NUM
    "#FF5721"
  end
end

get '/' do
  guess = params["guess"]
  message = check_guess(guess)
  color = color(guess)
  erb :index, :locals => {:number => NUM, :message => message, :color => color, :guess => guess}
end







