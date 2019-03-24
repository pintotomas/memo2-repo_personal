require 'rspec'
require_relative '../model/envido'
require_relative '../model/carta'
require_relative '../model/exceptions'

describe 'Envido' do
  # let(:envido) { Envido.new([]) }
  it 'envido con cartas de distinto palo e igual valor' do
    array_cartas = [Carta.new('basto', 3), Carta.new('oro', 3), Carta.new('espada', 3)]
    juego_envido = Envido.new(array_cartas)
    expect(juego_envido.calcular_tanto).to eq 3
  end
  it 'envido con cartas de distinto palo y distinto valor' do
    array_cartas = [Carta.new('basto', 3), Carta.new('oro', 3), Carta.new('espada', 7)]
    juego_envido = Envido.new(array_cartas)
    expect(juego_envido.calcular_tanto).to eq 7
  end
  it 'envido con una carta con palo invalido' do
    array_cartas = [Carta.new('corazones', 5), Carta.new('oro', 3), Carta.new('basto', 12)]
    expect { Envido.new(array_cartas) }.to raise_error(CartaConPaloInvalidoError)
  end
  it 'envido con una carta con valor invalido' do
    array_cartas = [Carta.new('basto', 8), Carta.new('oro', 3), Carta.new('basto', 12)]
    expect { Envido.new(array_cartas) }.to raise_error(CartaConValorInvalidoError)
  end
end
