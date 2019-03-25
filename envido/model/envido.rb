#!/usr/bin/ruby
require_relative 'exceptions.rb'
class Envido
  # Clase que engloba lo que son las reglas para el envido.
  # Por ejemplo, si tenemos 3 cartas del mismo palo para su calculo
  # Solo queremos las 2 de mayor valor de envido
  def initialize(card_collection)
    @cards_on_game = card_collection
  end

  def calcular_tanto
    palo_mayor_aparicion = cards_on_game.palo_de_mayor_aparicion
    cards_to_play = cards_on_game.obtener_cartas_con_palo(palo_mayor_aparicion)
    return cards_on_game.card_with_max_value.envido_value unless cards_to_play.length > 1

    # Si tenemos 3 cartas solo deberiamos tener en cuenta 2
    cards_to_play.calcular_puntos_de_envido
  end

  attr_reader :cards_on_game
end
