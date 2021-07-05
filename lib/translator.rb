require "yaml"

def load_library(file_path)
  new_hash={:get_meaning => {}, :get_emoticon => {}}
  library = YAML.load_file(file_path)
  library.each do |meaning, array|
    new_hash[:get_meaning][array[1]] = meaning
    new_hash[:get_emoticon][array[0]] = array[1]
  end
  new_hash
end

def get_japanese_emoticon(yaml_file_path, emoticon)
  library = load_library(yaml_file_path)
  if library[:get_emoticon][emoticon]
    return library[:get_emoticon][emoticon]
  else 
    return "Sorry, that emoticon was not found"
  end 
end

def get_english_meaning(yaml_file_path, emoticon)
  library = load_library(yaml_file_path)
  if library[:get_meaning][emoticon]
    return library[:get_meaning][emoticon]
  else
    return "Sorry, that emoticon was not found"
  end
end