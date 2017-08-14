# GG
# WFH
# ASAP

# turn sentence into accronym
def accronym(sentence)
# split sentence into words array
  words = sentence.upcase.split
  accronym = []
  words.each { |word| accronym.push(word[0]) }
  return accronym.join
end
# ask for input
puts "Please give us a sentence:"
user_sentence = gets.chomp
# output
puts accronym(user_sentence)


#alternative with .map
def accronym(sentence)
  words = sentence.upcase.split
  accronym = words.map { |word| word[0] }
  return accronym.join
end

puts "Please give us a sentence:"
user_sentence = gets.chomp
puts accronym(user_sentence)
