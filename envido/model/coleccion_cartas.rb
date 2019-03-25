class ColeccionCartas
  # Representa a una mano de cartas
  def initialize(array_cartas)
    @cards = array_cartas
  end

  def obtener_cartas_con_palo(palo); end

  def palo_de_mayor_aparicion
    freq_palos = cards.each_with_object(Hash.new(0)) { |v, h| h[v.palo] += 1; }
    cards.max_by { |v| freq_palos[v] }.palo
  end


  attr_reader :cards
end
