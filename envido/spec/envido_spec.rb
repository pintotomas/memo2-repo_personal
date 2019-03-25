require 'rspec'
require_relative '../model/envido'
require_relative '../model/coleccion_cartas.rb'
require_relative '../model/carta'
require_relative '../model/exceptions'

describe 'Envido' do
  # let(:envido) { Envido.new([]) }
  it 'envido con cartas de distinto palo e igual valor' do
    mano = [CartaTruco.new('basto', 3), CartaTruco.new('oro', 3), CartaTruco.new('espada', 3)]
    col_truco = ColeccionCartasTruco.new(mano)
    juego_envido = Envido.new(col_truco)
    expect(juego_envido.calcular_tanto).to eq 3
  end
  it 'envido con cartas de distinto palo y distinto valor' do
    mano = [CartaTruco.new('basto', 3), CartaTruco.new('oro', 3), CartaTruco.new('espada', 7)]
    col_truco = ColeccionCartasTruco.new(mano)
    juego_envido = Envido.new(col_truco)
    expect(juego_envido.calcular_tanto).to eq 7
  end
  # it 'envido con dos cartas de mismo palo, de valor 10 o mas' do
  #   mano = [CartaTruco.new('oro', 10), CartaTruco.new('oro', 11), CartaTruco.new('espada', 7)]
  #   juego_envido = Envido.new(ColeccionCartas.new(mano))
  #   expect(juego_envido.calcular_tanto).to eq 20
  # end
end
