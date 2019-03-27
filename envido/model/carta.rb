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
  def envido_value
    valor
  end
end

class FiguraTruco < CartaTruco
  def envido_value
    0
  end
end
