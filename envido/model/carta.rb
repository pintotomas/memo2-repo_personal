#!/usr/bin/ruby
class Carta
  def initialize(palo, valor)
    @palo = palo
    @valor = valor
  end

  attr_reader :palo

  attr_reader :valor
end
