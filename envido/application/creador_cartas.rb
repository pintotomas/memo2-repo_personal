#!/usr/bin/ruby
require_relative '../model/carta.rb'
class Factory
  def self.create_cards(cards_represented_in_string)
    palos = { 'p' => 'basto', 'c' => 'copa',
              'o' => 'oro', 'e' => 'espada' }

    cards = cards_represented_in_string.split(',')
    cards_to_play = []
    cards.each do |card|
      palo = palos[card[-1]]
      valor = card[0...-1].to_i
      nueva_carta = Carta.new(palo, valor)
      cards_to_play.push(nueva_carta)
    end
    cards_to_play
  end
end
