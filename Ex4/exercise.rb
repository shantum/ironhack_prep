puts "For encryption enter 1, else for decryption enter 2?"

option = gets.chomp.to_i

def encrypt()
    puts "what's your string?"

    input = gets.chomp.to_s
	
	my_array = input.split("").map(&:ord).to_a

	puts "whats your secret key?"

	key = gets.chomp.to_i

	new_ord = my_array.map {|a| a += key}

	new_string = new_ord.map(&:chr).join("")

	return new_string
end

def decrypt()
	puts "enter the encrypted string"

	input = gets.chomp.to_s

	my_array = input.split("").map(&:ord).to_a

	puts "whats the secret key?"

	key = gets.chomp.to_i

	new_ord = my_array.map {|a| a -= key}

	new_string = new_ord.map(&:chr).join("")

	return new_string
end


if option == 1 
	puts "Your encrypted string is: " + encrypt
elsif option == 2 
	puts "Your decrypted string is: " + decrypt
else 
	puts "please enter a valid option and retry"  end
	