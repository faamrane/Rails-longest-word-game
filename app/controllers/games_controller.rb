require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a
  end

  def score
    url = "https://wagon-dictionary.herokuapp.com/#{params[:words]}"
    word_serialized = URI.open(url).read
    word_exists = JSON.parse(word_serialized)["found"]
    if word_exists == true
      @answer = 'You won'
    else
      @answer = 'You lost'
    end
  end
end
