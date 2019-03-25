#!/usr/bin/ruby
require_relative 'exceptions.rb'
class Carta
  def initialize(palo, valor)
    @palo = palo
    @valor = valor
  end

  attr_reader :palo

  attr_reader :valor
end

class CartaTruco < Carta
  def initialize(palo, valor)
    valid_palos = %w[basto copa oro espada]
    valid_valores = [1, 2, 3, 4, 5, 6, 7, 10, 11, 12]
    valid_palos.include? palo
    valid_valores.include? valor
    super(palo, valor)
    raise PaloInvalidoError unless valid_palos.include? palo
    raise ValorInvalidoError unless valid_valores.include? valor
  end
end
