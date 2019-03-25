require 'rspec'
require_relative '../model/carta'
require_relative '../model/coleccion_cartas'

describe 'Coleccion de cartas' do
  it 'Palo de mayor aparicion cuando hay 2 cartas de un palo y 1 distinta' do
    coleccion = ColeccionCartas.new([Carta.new('o', 10), Carta.new('o', 11), Carta.new('e', 7)])
    expect(coleccion.palo_de_mayor_aparicion).to eq 'o'
  end
end
