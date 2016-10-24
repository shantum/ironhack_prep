class TextApp
  attr_reader :username, :password, :string

  def initialize(username, password)
    @username = username
    @password = password
    @string
  end

  def run_app
    if get_credentials == true
      get_user_input
    else puts "Sorry please try again!"; self.run_app
    end
  end

  def get_credentials
    print 'Username:>'
    username = gets.chomp.to_s
    print 'Password:>'
    password = gets.chomp.to_s
    if self.verify_credentials(username.to_s, password.to_s) == true
      return true
    else return false
    end
  end

  def verify_credentials (username, password)
    if username == @username && password == @password
      return true
    else return false
    end
  end

  def get_user_input
    print "Please enter some text:"
    @string = gets.chomp.to_s
    puts "You entered the following string: #{@string}"
    self.get_more_input
  end

  def get_more_input
    puts "What would you like to do with your string?"
    puts "1. Count Words; 2. Count letters, 3. Reverse Text; 4. Change to Uppercase; 5. Change to Lowercase"
    input = gets.chomp
    self.transform_input(input)
  end

  def transform_input(i, string=@string)
    case i
    when '1'
      puts "Your word count is #{string.split.size}."
    when '2'
      puts "Your letter count is #{string.length}"
    when '3'
      puts "Your reversed string is #{string.reverse}."
    when '4'
      puts "#{string.upcase}"
    when '5'
      puts "#{string.downcase}"
    when 'exit'
      exit!
    else
      puts "Invalid option. Please try again."
    end
    self.get_more_input
  end
end


new_app = TextApp.new('shantum', 'shantumshantum')

new_app.run_app
