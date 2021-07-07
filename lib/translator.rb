# require modules here
require "yaml"

 def load_library(emoticon_list)
  emoticons = YAML.load_file(emoticon_list)
  hash = {"get_meaning" => {}, "get_emoticon" =>{}}
  #key, then 1st entry english, then japanese(which are then the values?) yessum
  emoticons.each do |key, value|
    english = value[0]
    日本語 = value[1]
    hash["get_meaning"][日本語] = key
    hash["get_emoticon"][english] = 日本語
end
return hash
end




def get_japanese_emoticon(emoticon_list, えもじ) 
  新しいえもじ = load_library(emoticon_list)#I didn't learn how to kinda read kanji in college for nothing
  if 新しいえもじ["get_emoticon"].include?(えもじ)
  新しいえもじ["get_emoticon"][えもじ]
else
  return "Sorry, that emoticon was not found"
end
end

def get_english_meaning(emoticon_list, えもじ)
   新しいえもじ = load_library(emoticon_list) # millionth reminder: remember to actually use the methods you create- e.g load_file and not retyping it out again
  if 新しいえもじ["get_meaning"].include?(えもじ)
  新しいえもじ["get_meaning"][えもじ]
else
  return "Sorry, that emoticon was not found"
end
end

  
