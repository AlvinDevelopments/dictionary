class DictionarySearcher

  attr_reader :results

  def initialize(dictionary)
    @dictionary = dictionary
    @results = []
  end

   def change_dict(new_dict)
     @dictionary = new_dict
   end

   def search(search_term, search_type)
     @search_term = search_term
     if search_type == 1
       search_exact()
     elsif search_type == 2
       search_partial()
     elsif search_type == 3
       search_begins()
     elsif search_type == 4
       search_ends()
     end

   end


   def search_exact
     @dictionary.words.each do |word|
       if word == @search_term
         @results << word
       end
     end
   end

   def search_partial
     @dictionary.words.each do |word|
       if (/#{@search_term}/ =~ word) != nil
         @results << word
       end
     end
   end

   def search_begins
     @dictionary.words.each do |word|
       if (/#{@search_term}/ =~ word) == 0
         @results << word
       end
     end
   end

   def search_ends
     @dictionary.words.each do |word|
       if (/#{@search_term.reverse}/ =~ word.reverse) == 0
         @results << word
       end
     end
   end

   def clear_results
     @results = []
   end

   def result_words
     @results.size
   end

end
