gem 'rspec'

class Lexicon
  def eat_t(string)
    string = string.split('')
    string.each do |x|
      if x == 't'
        string.delete(x)
      end
      end
    return string.join
  end
end
