options = %w(rock paper scissors)

computer_hand = options.sample

puts "Please chose among #{options}"
user_hand = gets.chomp

until options.include? user_hand
  puts "Please provide a valid option"
  user_hand = gets.chomp
end

def game_output(computer_hand, user_hand)
  if computer_hand == user_hand
    puts "Tied"
  else
    if computer_hand == "rock"
      player_win = user_hand == "paper"
    elsif computer_hand == "paper"
      player_win = user_hand == "scissors"
    else
      player_win = user_hand == "rock"
    end
    puts player_win ? "You wom!" : "You lost!"
  end
end

puts "Computer chose #{computer_hand}."
puts game_output(computer_hand, user_hand)
