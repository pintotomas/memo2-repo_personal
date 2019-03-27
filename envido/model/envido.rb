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
    cant_cartas_q_suman = 2
    palo_mayor_aparicion = cards_on_game.palo_de_mayor_aparicion
    cartas_mismo_palo = cards_on_game.obtener_cartas_con_palo(palo_mayor_aparicion)
    return cards_on_game.card_with_max_value.envido_value unless cartas_mismo_palo.length > 1

    tanto_default = 20
    # Si tenemos 3 cartas del mismo palo solo tener en cuenta las 2 con mayor valor de envido
    tanto = if cartas_mismo_palo.length == 3
              cartas_mismo_palo.sort_by_envido_value.calcular_puntos_de_envido(cant_cartas_q_suman)
            else
              cartas_mismo_palo.calcular_puntos_de_envido
            end
    tanto + tanto_default
  end

  attr_reader :cards_on_game
end
