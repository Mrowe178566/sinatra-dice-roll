require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"
  
# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

get("/") do
  "
  <h1>Dice Roll</h1>
	
  <ul>
    <li><a href=\"/dice/2/6\">Roll two 6-sided dice</a></li>
    <li><a href=\"/dice/2/10\">Roll two 10-sided dice</a></li>
    <li><a href=\"/dice/1/20\">Roll one 20-sided die</a></li>
    <li><a href=\"/dice/5/4\">Roll five 4-sided dice</a></li>
    <li><a href=\"/dice/100/6\">Roll one hundred 6-sided dice</a></li>

  </ul>
  "
  erb(:elephant)
end

get("/zebra") do
  "We must add a route for each path we want to support"
end

get("/giraffe") do
  "Hopefully this shows up without having to restart the server 🤞🏾"
end

get("/dice/2/6") do
 @rolls = []    # Create a blank array

  100.times do    # 100 times...
    die = rand(1..6)    # Generate a random number

    @rolls.push(die)    # Add the random number to the array 
  end

  erb(:two_six)
end


get("/dice/2/10") do
 @rolls = []    # Create a blank array

  100.times do    # 100 times...
    die = rand(1..10)    # Generate a random number

    @rolls.push(die)    # Add the random number to the array 
  end

  erb(:two_ten)
end


get("/dice/1/20") do
  @rolls = []    # Create a blank array

  100.times do    # 100 times...
    die = rand(1..20)    # Generate a random number

    @rolls.push(die)    # Add the random number to the array 
  end

  erb(:one_twenty)
end


get("/dice/5/4") do
 @rolls = []    # Create a blank array

  100.times do    # 100 times...
    die = rand(1..4)    # Generate a random number

    @rolls.push(die)    # Add the random number to the array 
  end
  
  erb(:five_four)
end


get("/dice/100/6") do
  @rolls = []    # Create a blank array

  100.times do    # 100 times...
    die = rand(1..6)    # Generate a random number

    @rolls.push(die)    # Add the random number to the array 
  end

  erb(:one_hundred_six)
end
