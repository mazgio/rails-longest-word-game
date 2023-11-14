# frozen_string_literal: true

require 'open-uri'
require 'json'
# class comment
class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a.sample(10)
  end

  def score
    @letters = params[:letters]
    @user_input = params[:user_input]
    url = "https://wagon-dictionary.herokuapp.com/#{@user_input}"
    response = URI.open(url)
    json = JSON.parse(response.read)
    if user_input_fits_letters?
      @result = if json['found']
                  "Congrats, your word #{@user_input} is within #{@letters} and great goals!!!"
                else
                  'Hmmmmm nope, not in the dictionary'
                end
    else
      'WROOOONGGGGG'
    end
  end

  # URI.open("url#(@user_input)")
  def user_input_fits_letters?
    @user_input.chars.all? { |letter| @user_input.count(letter) <= @letters.count(letter) }
  end
end
