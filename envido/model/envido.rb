#!/usr/bin/ruby
require_relative 'exceptions.rb'
class Envido
  # Clase que engloba lo que son las reglas para el envido.
  # Por ejemplo, si tenemos 3 cartas del mismo palo para su calculo
  # Solo queremos las 2 de mayor valor de envido

  def initialize(card_collection)
    @mano_cartas = card_collection
    @puntos_default_dos_cartas_mismo_palo = 20
    @max_cant_cartas_para_calc = 2
  end

  def calcular_tanto
    freq_palo_mayor_aparicion = mano_cartas.frecuencia_palo_mayor_aparicion
    return mano_cartas.carta_maximo_valor(:envido_value).envido_value unless freq_palo_mayor_aparicion > 1

    # Si tenemos 2 o mas cartas

    palo_mayor_aparicion = mano_cartas.palo_de_mayor_aparicion
    cartas_mismo_palo = mano_cartas.obtener_cartas_con_palo(palo_mayor_aparicion)
    tanto = cartas_mismo_palo.sort(:envido_value).calcular_puntos_de_envido(@max_cant_cartas_para_calc)

    tanto + @puntos_default_dos_cartas_mismo_palo
  end

  attr_reader :mano_cartas
end
