puts "What is the source file?"

source_file = gets.chomp

puts "What would you like to name the new file?"

new_file_name = gets.chomp

source_file_contents = IO.read(source_file)

IO.write(new_file_name, source_file_contents)