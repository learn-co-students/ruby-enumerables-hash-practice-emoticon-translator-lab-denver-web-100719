require 'yaml'

def load_library(file_path)
  file_path = YAML.load_file('./lib/emoticons.yml')
  emoticon_library = {'get_meaning' => {}, 'get_emoticon' => {}}
  file_path.each do |meaning, emoticons|
    emoticon_library['get_meaning'][emoticons[1]] = meaning
    emoticon_library['get_emoticon'][emoticons[0]] = emoticons[1]
  
  end
  emoticon_library
end

def get_japanese_emoticon(file_path = './lib/emoticons.yml', english_emoticon)
  library = load_library(file_path)
  if library["get_emoticon"].include? (english_emoticon)
    library["get_emoticon"][english_emoticon]
  else "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file_path = './lib/emoticons.yml', japanese_emoticon)
 library = load_library(file_path)
 if library["get_meaning"].include? (japanese_emoticon)
   library["get_meaning"][japanese_emoticon]
   else "Sorry, that emoticon was not found"
 end
 
end