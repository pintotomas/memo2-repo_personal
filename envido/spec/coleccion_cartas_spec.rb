require 'rspec'
require_relative '../model/carta'
require_relative '../model/coleccion_cartas'

describe 'Coleccion de cartas' do
  it 'Palo de mayor aparicion cuando hay 2 cartas de un palo y 1 distinta' do
    coleccion = ColeccionCartas.new([Carta.new('o', 10), Carta.new('o', 11), Carta.new('e', 7)])
    expect(coleccion.palo_de_mayor_aparicion).to eq 'o'
  end
  it 'Palo de mayor aparicion cuando todos los palos son iguales' do
    coleccion = ColeccionCartas.new([Carta.new('e', 10), Carta.new('e', 11), Carta.new('e', 7)])
    expect(coleccion.palo_de_mayor_aparicion).to eq 'e'
  end
  it 'Mayor valor con todos los valores iguales' do
    coleccion = ColeccionCartas.new([Carta.new('e', 10), Carta.new('e', 10), Carta.new('e', 10)])
    expect(coleccion.maximo_valor).to eq 10
  end
  it 'Mayor valor con todos los valores distintos' do
    coleccion = ColeccionCartas.new([Carta.new('e', 10), Carta.new('e', 11), Carta.new('e', 12)])
    expect(coleccion.maximo_valor).to eq 12
  end
  it 'Valor de envido con una sola carta' do
    a = [CartaTruco.new('espada', 7)]
    mano_truco = ColeccionCartasTruco.new(a)
    expect(mano_truco.calcular_puntos_de_envido).to eq 7
  end
end
