#!/usr/bin/ruby
require_relative '../model/envido'
require_relative '../model/coleccion_cartas'
require_relative 'creador_cartas.rb'

class EnvidoGame
  def run(arguments)
    cards_to_play = Factory.create_cards_for_envido(arguments)
    card_collection = ColeccionCartasTruco.new(cards_to_play)
    envido = Envido.new(card_collection)
    result = envido.calcular_tanto
    puts 'Envido: ' + result.to_s
  rescue PaloInvalidoError
    puts 'El palo no es valido'
  rescue ValorInvalidoError
    puts 'El numero no es valido'
  end
end

new_game = EnvidoGame.new
new_game.run(ARGV[0])
