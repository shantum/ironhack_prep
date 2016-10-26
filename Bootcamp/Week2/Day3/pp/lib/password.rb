require "byebug"

class Identifier
  attr_reader :username, :password

  def initialize(email, password)
    @email = email
    first_split = @email.split('@')
    second_split = first_split[1].split('.')
    @username = first_split[0].to_s
    @domain = second_split[0].to_s
    @password = password
  end

  def check1
    check = false
    if @password.length > 7
      check = true
    end
  end

  def check2
    check = false
    if /(?=.{8,})(?=.*[a-zA-Z])(?=.*\d)(?=.*[!#$%&@?*+-.,:;'"])/.match(@password)
      check = true
    end
    return check
  end

  def check3
    if @password.downcase.include?(@username.downcase) || @password.downcase.include?(@domain.downcase)
      check = false
    else check = true
    end
  end

  def check_all
    if check1 && check2 && check3
      check = true
    else check = false
    end
    return check
  end
end

puts password.check_all
