class Dictionary

  attr_accessor :words

  def initialize
    @words = []
  end

  def add_word(word)
    @words << word
  end

  def word_count
    return @words.size
  end

end
