require "json"
require "open-uri"

class GamesController < ApplicationController
  def new
    alphabet = ('a'..'z').to_a
    @letters = alphabet.sample(10)
  end

  def score
    @guess = params[:guess]
    url = "https://wagon-dictionary.herokuapp.com/#{@guess}"
    @dictionary = JSON.parse(URI.open(url).read)
    if @dictiorary["found"] == true
      @reply = "#{@guess} is a word!"
    else
      @reply = "#{@guess} is not a word!"
    end
  end
end
