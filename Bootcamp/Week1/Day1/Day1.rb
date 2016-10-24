
class ProgrammingLanguage
  attr_accessor :name, :age, :type

  def initialize(name, age, type)
    @name = name
    @age = age
    @type = type
  end
end

ruby = ProgrammingLanguage.new("Ruby", 21, "Dynamic")
python = ProgrammingLanguage.new("Python", 24, "Dynamic")
javascript = ProgrammingLanguage.new("JavaScript", 20, "Dynamic")
go = ProgrammingLanguage.new("Go", 6, "Static")
rust = ProgrammingLanguage.new("Rust", 5, "Static")
swift = ProgrammingLanguage.new("Swift", 2, "Static")
java = ProgrammingLanguage.new("Java", 20, "Static")

class Array
  attr_accessor
  def initialize()
    @array_languages = []
  end
  def add_language_to_array(language)
    @array_languages.push(language)
  end
  def puts_array
    @array_languages.each do |language|
    puts "languages: #{language.name} age: #{language.age} type: #{language.type}"
    end
  end
  def new_year
    @array_languages.map do |language|
      language.age += 1
    end
  end