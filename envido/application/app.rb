#!/usr/bin/ruby
require_relative '../model/envido'
require_relative '../model/coleccion_cartas'
require_relative 'creador_cartas.rb'
require_relative 'output_adapter'

class EnvidoGame
  def run(arguments, output_adapter)
    cards_to_play = Factory.create_cards_for_envido(arguments)
    card_collection = ColeccionCartasTruco.new(cards_to_play)
    envido = Envido.new(card_collection)
    result = envido.calcular_tanto
    message = 'Envido: ' + result.to_s
    output_adapter.present(message)
  rescue PaloInvalidoError
    output_adapter.present('El palo no es valido')
  rescue ValorInvalidoError
    output_adapter.present('El numero no es valido')
  end
end

output_adapter = ConsoleAdapter.new
new_game = EnvidoGame.new
new_game.run(ARGV[0], output_adapter)
