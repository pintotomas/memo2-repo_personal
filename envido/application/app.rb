#!/usr/bin/ruby
require_relative '../model/envido'
require_relative 'creador_cartas.rb'

class EnvidoGame
  def run(arguments)
    cards_to_play = Factory.create_cards(arguments)
    envido = Envido.new(cards_to_play)
    envido.play_cards
  end
end

new_game = EnvidoGame.new
new_game.run(ARGV[0])
