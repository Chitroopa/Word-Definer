require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/word_definer')
require('pry')

get('/') do
  @words = Word.all()
  if (@words.length() == 0)
    new_word = Word.new({:word=> "Clouds", :img_url=> "http://offi.com/skuPix/WCWPCLOUD.jpg"})
    new_definition = Definition.new(:definition=>"A cloud is a large collection of very tiny droplets of water or ice crystals")
    new_word.add_definition(new_definition)
    new_word.save()

    new_word1 = Word.new({:word=> "Apple", :img_url=> "http://www.morecoloringpages.com/coloring_pages/sm_color/apple.gif"})
    new_definition = Definition.new(:definition=>"A round or oval fruit with red, yellow, or green skin and white flesh that grows on a spreading tree related to the rose")
    new_word1.add_definition(new_definition)
    new_word1.save()

    new_word2 = Word.new({:word=> "Sun", :img_url=> "https://img.clipartfox.com/f3e0469f1c06c780d0ebdf016825c1bf_free-clipart-pictures-sun-clipart-for-kids_550-600.png"})
    new_definition = Definition.new(:definition=>"The star that the Earth moves around and that gives the Earth heat and light.")
    new_word2.add_definition(new_definition)
    new_word2.save()
  end
  erb(:index)
end

get('/word/new') do
  erb(:word_form)
end

post('/words') do
  @words = Word.all()
  word = params.fetch("new-word")
  img_url = params.fetch("img-url")
  new_word = Word.new({:word=> word, :img_url=> img_url})
  meaning = params.fetch("meaning")
  new_definition = Definition.new(:definition=>meaning)
  new_word.add_definition(new_definition)
  new_word.save()
  erb(:index)
end

get('/word/:id') do
  @words = Word.find(params.fetch("id"))
  erb(:word)
end

post('/word/:id') do
  @words = Word.find(params.fetch("id"))
  meaning = params.fetch("meaning")
  new_definition = Definition.new(:definition=>meaning)
  @words.add_definition(new_definition)
  erb(:word)
end

get('/words/alphabetical') do
  @words = Word.sort_words()
  erb(:words_sort)
end
