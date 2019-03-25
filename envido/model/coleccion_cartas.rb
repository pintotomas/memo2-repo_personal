class ColeccionCartas
  # Representa a una mano de cartas
  def initialize(array_cartas)
    @cards = array_cartas
  end

  def obtener_cartas_con_palo(palo); end

  def palo_de_mayor_aparicion
    'o'
  end

  attr_reader :cards
end
