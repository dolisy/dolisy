# puts "Add message to encrypt:"
# message = gets.chomp.upcase

alphabet = ("A".."Z").to_a

def encrypt(message)
  return message.split(/\b/).each do |word|
    word.split(/\b/)
    p word
  end
end

encrypt("THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG")


