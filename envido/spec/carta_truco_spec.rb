require 'rspec'
require_relative '../model/carta'
require_relative '../model/exceptions'

describe 'CartaTruco' do
  it 'Inicializar una carta de truco con un palo invalido' do
    expect { CartaTruco.new('x', 3) }.to raise_error(PaloInvalidoError)
  end
  it 'Inicializar una carta de truco con un valor invalido' do
    expect { CartaTruco.new('basto', 8) }.to raise_error(ValorInvalidoError)
  end
  it 'Valor de envido de una carta con valor menor a 10 es el valor de la carta' do
    c1 = CartaTruco.new('basto', 4)
    expect(c1.envido_value). to eq 4
  end
end
