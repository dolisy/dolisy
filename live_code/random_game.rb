#write a game where the user must guess the number between 1 and 100 randomly chosen by computer
#- game stops when nb is guessed by user

#pseudo code: first step is to write in plain english steps to be taken by the code before doing it

#1. computer picks between 1 and 100

#2. user picks between 1 and 100

#3:
# --> user pick must be correct
# --~ tell user if correct

#4. if similar, game ends, otherwize, starts again

#1
comp_number = rand(0) + 1
#2
puts "Please select a number between 1 and 100"
user_number = gets.chomp

#4
if comp_number == user_number
  puts "Well done!"
else
  puts "Try again!"
end

#Let s loop it!
k = false
i = 0
until k == true
  while i < 3
    puts "Please select a number between 1 and 100"
    user_number = gets.chomp
    if comp_number == user_number
      puts "Well done!"
      k = true
    else
      puts "Try again!"
      k = false
    end
    i += 1
  end
  k = true
  puts "Your number of shots ended"
end

# live_code version

random_price = rand(1..100)
guess_price = 0                       #you need a value to enter the loop
while guess_price != random_price
  puts "Guess the price"
  guess_price = gets.chomp.to_i
  if guess_price == random_price
    puts "Congrats"
  elsif guess_price > random_price
    puts "Guess lower"
  else
    puts "Guess higher"
  end
end











