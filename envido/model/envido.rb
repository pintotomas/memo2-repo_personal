#!/usr/bin/ruby
require_relative 'exceptions.rb'
class Envido
  def calculate
    -1
  end

  def initialize(card_array)
    valid_palos = %w[basto copa oro espada]
    card_array.each do |card|
      raise PaloError unless valid_palos.include? card.palo

      @cards_on_game = card_array
    end
  end

  attr_reader :cards_on_game
end
