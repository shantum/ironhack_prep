require "sinatra"
require_relative "lib/calculator"

@calculator = Calculator.new

get "/calculate" do
  erb(:calculator)
end

post "/calculate" do
  first  = params[:first_number].to_f
  second = params[:second_number].to_f
  operation = params['operation']
  if operation == 'addition'
    @result = first + second
  elsif operation == "subtraction"
    @result = first - second
  elsif operation == 'multiplication'
    @result = first * second
  elsif operation == 'division'
    @result = first / second
  end
  erb(:calculator)
end

get "/add" do
  erb(:add)
end

post "/calculate_add" do
  #add numbers here
  first  = params[:first_number].to_f
  second = params[:second_number].to_f
  result = calculator.add(first, second)
  "#{first} + #{second} = #{result}"
end

get '/subtract' do
  erb(:subtract)
end

post "/calculate_subtract" do
  first  = params[:first_number].to_f
  second = params[:second_number].to_f
  result = calculator.subtract(first, second)
  "#{first} - #{second} = #{result}"
end

get '/multiply' do
  erb(:multiply)
end

post "/calculate_multiply" do
  first  = params[:first_number].to_f
  second = params[:second_number].to_f
  result = calculator.multiply(first, second)
  "#{first} * #{second} = #{result}"
end

get '/divide' do
  erb(:divide)
end

post "/calculate_divide" do
  first  = params[:first_number].to_f
  second = params[:second_number].to_f
  result = calculator.divide(first, second)
  "#{first} / #{second} = #{result}"
end
