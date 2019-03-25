require 'rspec'
require_relative '../model/envido'
require_relative '../model/coleccion_cartas.rb'
require_relative '../model/carta'
require_relative '../model/exceptions'

describe 'Envido' do
  # let(:envido) { Envido.new([]) }
  it 'envido con cartas de distinto palo e igual valor' do
    mano = ColeccionCartas.new([Carta.new('basto', 3), Carta.new('oro', 3), Carta.new('espada', 3)])
    juego_envido = Envido.new(mano)
    expect(juego_envido.calcular_tanto).to eq 3
  end
  it 'envido con cartas de distinto palo y distinto valor' do
    mano = ColeccionCartas.new([Carta.new('basto', 3), Carta.new('oro', 3), Carta.new('espada', 7)])
    juego_envido = Envido.new(mano)
    expect(juego_envido.calcular_tanto).to eq 7
  end
  it 'envido con dos cartas de mismo palo, de valor 10 o mas' do
    mano = ColeccionCartas.new([Carta.new('oro', 10), Carta.new('oro', 11), Carta.new('espada', 7)])
    juego_envido = Envido.new(mano)
    expect(juego_envido.calcular_tanto).to eq 20
  end
  it 'envido con una carta con palo invalido' do
    mano = ColeccionCartas.new([Carta.new('x', 5), Carta.new('oro', 3), Carta.new('basto', 12)])
    expect { Envido.new(mano) }.to raise_error(PaloInvalidoError)
  end
  it 'envido con una carta con valor invalido' do
    mano = ColeccionCartas.new([Carta.new('basto', 8), Carta.new('oro', 3), Carta.new('basto', 12)])
    expect { Envido.new(mano) }.to raise_error(ValorInvalidoError)
  end
end
