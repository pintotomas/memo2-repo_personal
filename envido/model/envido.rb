#!/usr/bin/ruby
require_relative 'exceptions.rb'
class Envido
  def calculate
    -1
  end

  def initialize(card_array)
    @cards_on_game = card_array
  end

  attr_reader :cards_on_game
end
