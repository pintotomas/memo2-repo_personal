#!/usr/bin/ruby
require_relative '../model/carta.rb'
class Factory
  @palos_truco = { 'p' => 'basto', 'c' => 'copa',
                   'o' => 'oro', 'e' => 'espada' }

  @clases_truco = { '01' => CartaTruco, '02' => CartaTruco, '03' => CartaTruco,
                    '04' => CartaTruco, '05' => CartaTruco, '06' => CartaTruco,
                    '07' => CartaTruco, '10' => FiguraTruco, '11' => FiguraTruco,
                    '12' => FiguraTruco }
  def self.create_cards_for_envido(cards_represented_in_string)
    cards = cards_represented_in_string.split(',')
    cards_to_play = []
    cards.each do |card|
      palo_ingresado = card[-1]
      raise PaloInvalidoError unless @palos_truco.key?(palo_ingresado)

      palo = @palos_truco[palo_ingresado]
      valor_ingresado = card[0...-1]
      raise ValorInvalidoError unless @clases_truco.key?(valor_ingresado)

      valor = valor_ingresado.to_i
      # nueva_carta = CartaTruco.new(palo, valor)
      nueva_carta = @clases_truco.fetch(valor_ingresado).new(palo, valor)
      cards_to_play.push(nueva_carta)
    end
    cards_to_play
  end
end
