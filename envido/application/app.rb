#!/usr/bin/ruby
require_relative '../model/envido'
require_relative '../model/coleccion_cartas'
require_relative 'creador_cartas.rb'

class EnvidoGame
  def run(arguments)
    cards_to_play = Factory.create_cards(arguments)
    card_collection = ColeccionCartas.new(cards_to_play)
    envido = Envido.new(card_collection)
    result = envido.calcular_tanto
    puts 'Envido: ' + result.to_s
  rescue CartaConPaloInvalidoError
    puts 'El palo no es valido'
  rescue CartaConValorInvalidoError
    puts 'El numero no es valido'
  end
end

new_game = EnvidoGame.new
new_game.run(ARGV[0])
