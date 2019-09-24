require 'yaml'
require 'pry'

def load_library (file)
  emoticon_hash = YAML.load_file(file)
  make_keys = {get_meaning: {}, get_emoticon: {}}
  emoticon_hash.each do |meaning, emoticon|
    make_keys[:get_meaning][emoticon[1]] = meaning
    make_keys[:get_emoticon][emoticon[0]] = emoticon[1]
  end
  make_keys
end

def get_japanese_emoticon(file, emoticon)
    library = load_library(file) 
    if library[:get_emoticon].has_key?(emoticon)
      library[:get_emoticon][emoticon]
    else
      "Sorry, that emoticon was not found"
    end
end

def get_english_meaning(file, japanese_emoticon)
  library = load_library(file)
  if library[:get_meaning].has_key?(japanese_emoticon)
    library[:get_meaning][japanese_emoticon]
  else
    "Sorry, that emoticon was not found"
  end
end