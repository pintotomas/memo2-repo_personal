#!/usr/bin/ruby
require_relative '../model/envido'
require_relative '../model/coleccion_cartas'
require_relative 'creador_cartas.rb'
require_relative 'output_adapter.rb'
require_relative 'input_adapter.rb'

class EnvidoGame
  def run(input_adapter, output_adapter)
    cards_to_play = Factory.create_cards_for_envido(input_adapter.read)
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

input_adapter = ConsoleInputAdapter.new(ARGV[0])
output_adapter = ConsoleOutputAdapter.new
new_game = EnvidoGame.new
new_game.run(input_adapter, output_adapter)
