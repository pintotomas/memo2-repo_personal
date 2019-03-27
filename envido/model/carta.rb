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
    super(palo, valor)
    @envido_value = valor
  end

  attr_reader :envido_value
end

class FiguraTruco < CartaTruco
  def initialize(palo, valor)
    super(palo, valor)
    @envido_value = 0
  end

  attr_reader :envido_value
end
