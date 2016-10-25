class Calculator
  attr_reader :history

  def initialize
    @history = []
  end

  def add(first_num, second_num)
    result = first_num.to_f + second_num.to_f
  end

  def subtract(first_num, second_num)
    result = first_num.to_f - second_num.to_f
  end

  def multiply(first_num, second_num)
    result = first_num.to_f * second_num.to_f
  end

  def divide(first_num, second_num)
    result = first_num.to_f / second_num.to_f 
  end
end
