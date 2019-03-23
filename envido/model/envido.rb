#!/usr/bin/ruby
require_relative 'exceptions.rb'
class Envido
  def calculate
    -1
  end

  def initialize(card_array)
    valid_palos = %w[basto copa oro espada]
    valid_valores = [1, 2, 3, 4, 5, 6, 7, 10, 11, 12]
    card_array.each do |card|
      raise PaloError unless valid_palos.include? card.valid_palo
      return ValorError unless valid_valores.include? card.valor

      @cards_on_game = card_array
    end
  end

  attr_reader :cards_on_game
end
