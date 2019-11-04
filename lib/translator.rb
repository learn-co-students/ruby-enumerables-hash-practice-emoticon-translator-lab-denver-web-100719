# require modules here
require "yaml" #require what lets yaml work
def load_library(file_path) #loads in a file path
  hash = {get_meaning: {}, get_emoticon: {}} # hash that will be returned has keys get meaning and get emoticons that point to empty hashes
  emoticons = YAML.load_file(file_path) #sets the yaml file to vriable emoticons
  emoticons.each do |meanings, array| #splits yaml file up into meanings keys and arrays that they point to
  hash[:get_meaning]["#{array[1]}"] = "#{meanings}" #populates the empty hash that get_meaning points to with a key which is the japanese emoticon to the meaning
  hash[:get_emoticon]["#{array[0]}"] = "#{array[1]}" # populates the empty hash that ger_emoticon with a key which is the english emoticon that points to the japanese emoticon
end
  hash # returns the hash
end

def get_japanese_emoticon(file_path, emoticon) # accepts a file path and an emotion
  if load_library(file_path)[:get_emoticon][emoticon] # if the emoticon exists as a key in the hash of emotions
    return load_library(file_path)[:get_emoticon][emoticon] # return the value of that emoticon which will piont to the japanese emoji
  else
    return  "Sorry, that emoticon was not found" # else return sorry message
  end
end

def get_english_meaning(file_path, emoticon)# accepts a file path and an emotion
  if load_library(file_path)[:get_meaning][emoticon]  # if the emoticon exists as a key in the hash of emotions
    load_library(file_path)[:get_meaning][emoticon] # return the value of that emoticon which will piont to its meaning
  else
    return  "Sorry, that emoticon was not found"# else return sorry message
  end
end
