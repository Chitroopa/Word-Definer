class Definition
  attr_reader(:definition)
  def initialize(attributes)
    @definition = attributes[:definition]
  end
end

class Word
  attr_reader(:word, :img_url,:definition, :id)
  @@words = []

  def initialize(attributes)
    @word = attributes[:word]
    @img_url = attributes[:img_url]
    @definition = []
    @id = @@words.length() + 1
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

  def self.find (id)
    found_word = nil
    @@words.each() do |word|
      if word.id() == id.to_i
        found_word = word
      end
    end
    found_word
  end

  def add_definition(definition)
    @definition.push(definition)
  end

  

end
