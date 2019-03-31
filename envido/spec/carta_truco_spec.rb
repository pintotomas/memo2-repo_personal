require 'rspec'
require_relative '../model/carta'
require_relative '../model/exceptions'

describe 'CartaTruco' do
  it 'Valor de envido de una carta con valor menor a 10 es el valor de la carta' do
    c1 = CartaTruco.new('basto', 4)
    expect(c1.envido_value). to eq 4
  end
  it 'Valor de envido de una carta con valor mayor o igual a 10 es 0' do
    c2 = FiguraTruco.new('basto', 10)
    expect(c2.envido_value). to eq 0
  end
end
