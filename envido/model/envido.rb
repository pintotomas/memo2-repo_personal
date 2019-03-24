#!/usr/bin/ruby
require_relative 'exceptions.rb'
class Envido
  def initialize(card_array)
    valid_palos = %w[basto copa oro espada]
    valid_valores = [1, 2, 3, 4, 5, 6, 7, 10, 11, 12]
    card_array.each do |card|
      raise CartaConPaloInvalidoError unless valid_palos.include? card.palo
      raise CartaConValorInvalidoError unless valid_valores.include? card.valor

      @cards_on_game = card_array
    end
  end

  def calcular_tanto
    cards_on_game.max_by(&:valor).valor
  end

  attr_reader :cards_on_game
end
