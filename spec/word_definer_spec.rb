require('rspec')
require('word_definer')

describe('Definition') do
  describe("#attr_reader") do
    it("will return definition") do
      test_definition = Definition.new({:definition=> "definition of word"})
      expect(test_definition.definition()).to eq("definition of word")
    end
  end
end

describe('Word') do
  before() do
   Word.clear()
  end
  describe("#attr_reader") do
    it("will return word") do
      test_word = Word.new({:word=> "Sun", :img_url=>"http://www.clipartbest.com/cliparts/nTX/89E/nTX89EpKc.jpg"})
      expect(test_word.word()).to eq("Sun")
      expect(test_word.img_url()).to eq("http://www.clipartbest.com/cliparts/nTX/89E/nTX89EpKc.jpg")
      expect(test_word.id()).to eq(1)
    end
  end

  describe(".all") do
    it ("return empty array of words") do
      test_word = Word.new({:word=> "Sun", :img_url=>"http://www.clipartbest.com/cliparts/nTX/89E/nTX89EpKc.jpg"})
      expect(Word.all()).to eq([])
    end
  end

  describe("#save") do
    it ("return empty array of words") do
      test_word = Word.new({:word=> "Sun", :img_url=>"http://www.clipartbest.com/cliparts/nTX/89E/nTX89EpKc.jpg"})
      test_word.save()
      expect(Word.all()).to eq([test_word])
    end
  end

  describe(".find") do
    it("returns a word by it's id number") do
      test_word = Word.new({:word=> "Sun", :img_url=>"http://www.clipartbest.com/cliparts/nTX/89E/nTX89EpKc.jpg"})
      test_word.save()
      expect(Word.find(test_word.id())).to eq(test_word)
    end
  end

  describe("#add_definition") do
    it("returns a word with defintion array") do
      test_word = Word.new({:word=> "Sun", :img_url=>"http://www.clipartbest.com/cliparts/nTX/89E/nTX89EpKc.jpg"})
      test_definition = Definition.new({:definition=> "definition of word"})
      test_word.add_definition(test_definition)
      test_word.save()
      expect(Word.all()).to eq([test_word])
      expect(test_word.definition()).to eq([test_definition])
    end
  end

  describe(".sort_words") do
    it ("return words sorted alphabetically") do
      test_word = Word.new({:word=> "Sun", :img_url=>"http://www.clipartbest.com/cliparts/nTX/89E/nTX89EpKc.jpg"})
      test_word.save()
      test_word1 = Word.new({:word=> "Ball", :img_url=>"http://www.clipartbest.com/cliparts/nTX/89E/nTX89EpKc.jpg"})
      test_word1.save()
      test_word2 = Word.new({:word=> "Apple", :img_url=>"http://www.clipartbest.com/cliparts/nTX/89E/nTX89EpKc.jpg"})
      test_word2.save()
      expect(Word.sort_words()).to eq([test_word2, test_word1, test_word])
    end
  end

  describe(".word_search") do
    it ("will search for word and returns it") do
      test_word = Word.new({:word=> "Sun", :img_url=>"http://www.clipartbest.com/cliparts/nTX/89E/nTX89EpKc.jpg"})
      test_word.save()
      test_word1 = Word.new({:word=> "Ball", :img_url=>"http://www.clipartbest.com/cliparts/nTX/89E/nTX89EpKc.jpg"})
      test_word1.save()
      test_word2 = Word.new({:word=> "Apple", :img_url=>"http://www.clipartbest.com/cliparts/nTX/89E/nTX89EpKc.jpg"})
      test_word2.save()
      expect(Word.word_search(test_word2.word())).to eq([test_word2])
    end
  end

end
