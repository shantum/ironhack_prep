require "ruby-dictionary"
require "pry-byebug"

dictionary = Dictionary.from_file('/usr/share/dict/words')

class WordChain
  attr_reader :dictionary

  def initialize(dict)
    @dictionary = dict
  end

  def check_word(word)
    if @dictionary.exists?(word)
      return true
    else return false
    end
  end

  def find_new_chain (starting_word, ending_word)

    if starting_word.length == ending_word.length
      len = starting_word.length
    else puts "Words are not of the same length"
    end

    results = []
    starting_word_array = starting_word.split("")
    ending_word_array = ending_word.split("")
    i = 0
    until starting_word_array == ending_word_array
      new_word_array = starting_word_array.each_with_index.map do |char, index|
       if i == index
        if char == ending_word_array[index]
          char
        else
          ending_word_array[index]
        end
      else
          char
       end
     end


      if self.check_word(new_word_array.join) == true;

        starting_word_array = new_word_array;
        unless results.include?(starting_word_array.join); results << starting_word_array.join end
        i += 1
      else i += 1;
      end
      if i == starting_word.length; i = 0 end
    end
    puts results
  end
end

puzzle = WordChain.new(dictionary)

puzzle.find_new_chain('duck', 'prom')
