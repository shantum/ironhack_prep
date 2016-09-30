puts "This program return an alphebetical array of the words in a sentence. What's your sentence?"

setence = gets.chomp

myarray = setence.split(" ").sort

puts myarray