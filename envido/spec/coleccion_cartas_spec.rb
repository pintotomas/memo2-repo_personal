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
    expect(coleccion.carta_maximo_valor(:valor).valor).to eq 10
  end
  it 'Mayor valor con todos los valores distintos' do
    coleccion = ColeccionCartas.new([Carta.new('e', 10), Carta.new('e', 11), Carta.new('e', 12)])
    expect(coleccion.carta_maximo_valor(:valor).valor).to eq 12
  end
  it 'Valor de envido con dos cartas del mismo palo y mayores a 10' do
    c = [FiguraTruco.new('espada', 10), FiguraTruco.new('espada', 11)]
    mano_truco = ColeccionCartasTruco.new(c)
    expect(mano_truco.calcular_puntos_de_envido).to eq 0
  end
  it 'Valor de envido con dos cartas del mismo palo, una mayor a 10 y otra menor' do
    c = [CartaTruco.new('espada', 7), FiguraTruco.new('espada', 11)]
    mano_truco = ColeccionCartasTruco.new(c)
    expect(mano_truco.calcular_puntos_de_envido).to eq 7
  end
end
