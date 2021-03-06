class Definition
  attr_reader(:definition)
  def initialize(attributes)
    @definition = attributes[:definition]
  end
end

class Word
  attr_reader(:word, :img_url,:definition, :id)
  @@words = []
  @@sort_words = []

  def initialize(attributes)
    @word = attributes[:word]
    @img_url = attributes[:img_url]
    @definition = []
    @id = @@words.length() + 1
  end

  def add_definition(definition)
    @definition.push(definition)
  end

  def save
    @@words.push(self)
  end

  def self.all
    @@words
  end

  def self.clear
    @@words = []
  end

  def self.find(id)
    found_word = nil
    @@words.each() do |word|
      if word.id() == id.to_i
        found_word = word
      end
    end
    return found_word
  end

  def self.sort_words
    @@sort_words = @@words.sort_by(&:word)
  end

  def self.sample_word
    random_word = @@words.sample()
    return random_word
  end

  def self.word_search(search_word)
    found_word = @@words.select{|word| word.word().downcase() == search_word.downcase()}
    return found_word
  end
end
