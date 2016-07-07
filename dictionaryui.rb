require_relative 'dictionary.rb'
require_relative 'dictionaryloader.rb'
require_relative 'dictionarysearcher.rb'
require_relative 'resultssaver.rb'

class DictionaryUI

  def initialize
    @loader
    @search = DictionarySearcher.new("")
    @saver = ResultsSaver.new()
  end

  def run
    puts "Where is your dictionary? ('q' to quit)"
    # location = gets.chomp
    location = "5desk.txt"
    @loader = DictionaryLoader.new(location)
    dict = @loader.load
    @search.change_dict(dict)

    while(true)
      puts "What kind of search?"
      puts "1: Exact"
      puts "2: Partial"
      puts "3: Begins With"
      puts "4: Ends With"
      puts "Q: Quit"
      search_type = gets.chomp.to_i
      puts "Enter the search term"
      search_term = gets.chomp

      @search.search(search_term, search_type)
      puts "Found #{@search.result_words} matches:"
      puts @search.results
      puts "Do you want to save results? y/n? 'q' quits."
      decision = gets.chomp
      return if decision == 'q'
      if decision == 'y'
        puts "What filepath should we write results to?"
        file_path = gets.chomp
        @saver.save_batch(@search.results, file_path)
      end
    @search.clear_results
    end
  end


end

dictionary = DictionaryUI.new()
dictionary.run
