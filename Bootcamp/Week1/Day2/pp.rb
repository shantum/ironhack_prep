require "pry"
require "mail"

class Employee
  attr_reader :name, :email
  def initialize(name, email)
    @name = name
    @email = email
  end
end

class HourlyEmployee < Employee
  def initialize(name, email, hourly_rate, hours_worked)
      @name = name
      @email = email
      @hourly_rate = hourly_rate
      @hours_worked = hours_worked
  end

  def calculate_salary
    salary = @hourly_rate * @hours_worked
    return salary
  end
end

class SalariedEmployee < Employee
    def initialize(name, email, weekly_salary, weeks_worked=1)
        @name = name
        @email = email
        @weekly_salary = weekly_salary / 52
        @weeks_worked = weeks_worked
    end

    def calculate_salary
      salary = @weekly_salary * @weeks_worked
      return salary
    end
end

class MultiPaymentEmployee < Employee
    def initialize(name, email, base_salary=60000, hourly_rate=275, hours_worked)
      @name = name
      @email = email
      @base_salary = base_salary
      @hourly_rate = hourly_rate
      @hours_worked = hours_worked
    end

    def calculate_salary
      weekly_salary = @base_salary / 52
      unless @hours_worked <= 40; weekly_salary += (@hours_worked - 40) * @hourly_rate end
      return weekly_salary
    end


end

class Payroll
  def initialize(employees)
    @employees = employees
  end

  def pay_employees
    total_salaries = 0
    @employees.each do |employee|
      salary_with_tax = employee.calculate_salary * 1.18
      puts "#{employee.name} has a salary of $#{salary_with_tax}"
      total_salaries += salary_with_tax
      notify_employees(employee)
    end
    puts "The total due to employees for this week is: $#{total_salaries}"
  end

  def notify_employees(employee)
      mail    = Mail.new do
      from     'test@payroll.com'
      to       employee.email
      subject  'Your payroll information'
      body     "#{employee.name}'s total salary of $#{employee.calculate_salary} for this week has been credited to your account."
  end
  puts mail
  end

end

josh    = HourlyEmployee.new('Josh', 'nachoemail@example.com', 35, 50)
nizar   = SalariedEmployee.new('Nizar', 'starcraftrulez@gmail.com', 1000000)
ted     = MultiPaymentEmployee.new('Ted', 'fortranr0x@gmail.com', 60000, 275, 55)
diego   = SalariedEmployee.new('Diego', 'diego@diego.com', 100000)
kudra   = MultiPaymentEmployee.new('Kudra', 'kudra@kudra.com', 500000, 500, 50)
shantum = HourlyEmployee.new('Shantum', 'shantum@shantum.com', 50, 50)

employees = [josh, nizar, ted, diego, kudra, shantum]

payroll = Payroll.new(employees)

payroll.pay_employees
