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
end
