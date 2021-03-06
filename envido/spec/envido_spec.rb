require 'rspec'
require_relative '../model/envido'
require_relative '../model/coleccion_cartas.rb'
require_relative '../model/carta'
require_relative '../model/exceptions'
require 'byebug'

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
  it 'envido con dos cartas de mismo palo, de valor 10 o mas' do
    mano = [FiguraTruco.new('oro', 10), FiguraTruco.new('oro', 11), CartaTruco.new('espada', 7)]
    juego_envido = Envido.new(ColeccionCartasTruco.new(mano))
    expect(juego_envido.calcular_tanto).to eq 20
  end
  it 'envido con tres cartas del mismo palo, con una mayor que 10' do
    mano = [FiguraTruco.new('oro', 10), CartaTruco.new('oro', 5), CartaTruco.new('oro', 7)]
    juego_envido = Envido.new(ColeccionCartasTruco.new(mano))
    expect(juego_envido.calcular_tanto).to eq 32
  end
  it 'envido con tres cartas del mismo palo, con dos mayor que 10' do
    mano = [FiguraTruco.new('oro', 10), FiguraTruco.new('oro', 10), CartaTruco.new('oro', 7)]
    juego_envido = Envido.new(ColeccionCartasTruco.new(mano))
    expect(juego_envido.calcular_tanto).to eq 27
  end
  it 'envido con tres cartas del mismo palo, con tres mayor que 10' do
    mano = [FiguraTruco.new('oro', 10), FiguraTruco.new('oro', 11), FiguraTruco.new('oro', 12)]
    juego_envido = Envido.new(ColeccionCartasTruco.new(mano))
    expect(juego_envido.calcular_tanto).to eq 20
  end
  it 'envido con tres cartas del mismo palo, con tres menores que 10' do
    mano = [CartaTruco.new('oro', 3), CartaTruco.new('oro', 4), CartaTruco.new('oro', 7)]
    juego_envido = Envido.new(ColeccionCartasTruco.new(mano))
    expect(juego_envido.calcular_tanto).to eq 31
  end
end
