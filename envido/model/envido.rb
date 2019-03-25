#!/usr/bin/ruby
require_relative 'exceptions.rb'
class Envido
  def initialize(card_collection)
    valid_palos = %w[basto copa oro espada]
    valid_valores = [1, 2, 3, 4, 5, 6, 7, 10, 11, 12]
    card_collection.each do |card|
      raise CartaConPaloInvalidoError unless valid_palos.include? card.palo
      raise CartaConValorInvalidoError unless valid_valores.include? card.valor

      @cards_on_game = card_collection
    end
  end

  def calcular_tanto
    palo_mayor_aparicion = cards_on_game.palo_de_mayor_aparicion
    cards_to_play = cards_on_game.obtener_cartas_con_palo(palo_mayor_aparicion)
    return cards_on_game.maximo_valor unless cards_to_play.length > 1

    tanto = 0
    cards_to_play.each do |carta|
      tanto += if carta.valor > 7
                 10
               else
                 carta.valor
               end
    end
    tanto
  end

  attr_reader :cards_on_game
end
