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
  it 'Carta de mayor valor con todos los valores iguales' do
    coleccion = ColeccionCartas.new([Carta.new('e', 10), Carta.new('e', 10), Carta.new('e', 10)])
    expect(coleccion.maximo_valor).to eq 10
  end
end
