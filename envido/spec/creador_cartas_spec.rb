require 'rspec'
require_relative '../application/creador_cartas.rb'

describe 'creador_cartas' do
  it 'Inicializar una carta de truco con un palo invalido' do
    expect { Factory.create_cards_for_envido('07p,06p,04x') }.to raise_error(PaloInvalidoError)
  end
  it 'Inicializar una carta de truco con un valor invalido' do
    expect { Factory.create_cards_for_envido('07p,06p,09o') }.to raise_error(ValorInvalidoError)
  end
end
