require 'rspec'
require_relative '../model/envido'
require_relative '../model/carta'
require_relative '../model/exceptions'

describe 'Envido' do
  # let(:envido) { Envido.new([]) }

  it 'test palo invalido' do
    cinco_de_corazones = Carta.new('corazones', 5)
    tres_de_oro = Carta.new('oro', 3)
    doce_de_basto = Carta.new('basto', 12)
    array_cartas = [cinco_de_corazones, tres_de_oro, doce_de_basto]
    expect { Envido.new(array_cartas) }.to raise_error(PaloError)
  end

=begin # rubocop:disable all
  it 'chop de 3 y [3] deberia ser 0' do
    expect(chopper.chop(3, [3])).to eq 0
  end

  it 'chop de 3 y [0,7,3] deberia ser 2' do
    expect(chopper.chop(3, [0,7,3])).to eq 2
  end

  it 'sum de [] deberia ser vacio' do
    expect(chopper.sum([])).to eq 'vacio'
  end

  it 'sum de [1] deberia ser uno' do
    expect(chopper.sum([1])).to eq 'uno'
  end

  it 'sum de [1,3] deberia ser cuatro' do
    expect(chopper.sum([1, 3])).to eq 'cuatro'
  end

  it 'sum de [9,9] deberia ser uno,ocho' do
    expect(chopper.sum([9, 9])).to eq 'uno,ocho'
  end

  it 'sum de [50,50] deberia ser demasiado grande' do
    expect(chopper.sum([50, 50])).to eq 'demasiado grande'
  end

  it 'sum de [50,49] deberia ser nueve,nueve' do
    expect(chopper.sum([50, 49])).to eq 'nueve,nueve'
  end

  it 'sum de [0,0] deberia ser cero' do
    expect(chopper.sum([0, 0])).to eq 'cero'
  end

  it 'sum de [15] deberia ser uno,cinco' do
    expect(chopper.sum([15])).to eq 'uno,cinco'
  end

  it 'sum de [20,1,1,1] deberia ser dos,tres' do
    expect(chopper.sum([20, 1, 1, 1])).to eq 'dos,tres'
  end
=end # rubocop:enable all

end
