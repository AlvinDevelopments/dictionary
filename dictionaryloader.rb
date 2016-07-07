require_relative 'dictionary.rb'

class DictionaryLoader

  def initialize(path)
    @dictionary = Dictionary.new()
    @path = path
  end

  def load
    raw_dictionary = File.readlines(@path)
    raw_dictionary.each do |word|
      @dictionary.add_word(word.strip)
    end


    puts "Dictionary successfully loaded"
    puts "Your dictionary contains #{@dictionary.word_count} words."
    puts "Word frequency by starting letter:"

    i = 0
    freq = []
    unique_char = @dictionary.words[0][0]
    count = 0

    @dictionary.words.each do |word|
      if (unique_char.downcase == word[0].downcase)
        count += 1
      else
        freq[i] = count
        puts "#{(65+i).chr}: #{count}"
        unique_char = word[0]
        count = 0
        i += 1
      end

    end

    puts "#{(65+i).chr}: #{count}"

    return @dictionary
  end


end
