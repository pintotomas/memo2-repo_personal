#!/usr/bin/ruby
require_relative '../model/envido'
require_relative 'creador_cartas.rb'

class EnvidoGame
  def run(arguments)
    cards_to_play = Factory.create_cards(arguments)
    envido = Envido.new
    envido.play_cards(cards_to_play)
  end
end

new_game = EnvidoGame.new
new_game.run(ARGV[0])
