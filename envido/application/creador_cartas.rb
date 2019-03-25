#!/usr/bin/ruby
require_relative '../model/carta.rb'
class Factory
  @palos = { 'p' => 'basto', 'c' => 'copa',
             'x' => 'diamante', 's' => 'corazones',
             'o' => 'oro', 'e' => 'espada' }

  def self.create_cards_for_envido(cards_represented_in_string)
    cards = cards_represented_in_string.split(',')
    cards_to_play = []
    cards.each do |card|
      palo = @palos[card[-1]]
      valor = card[0...-1].to_i
      nueva_carta = CartaTruco.new(palo, valor)
      cards_to_play.push(nueva_carta)
    end
    cards_to_play
  end
end
