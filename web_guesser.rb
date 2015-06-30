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

get '/' do
  guess = params["guess"]
  message = check_guess(guess)
  erb :index, :locals => {:number => NUM, :message => message}
end





