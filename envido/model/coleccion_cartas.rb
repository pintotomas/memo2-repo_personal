class ColeccionCartas
  # Representa a una mano de cartas
  def initialize(array_cartas)
    @cards = array_cartas
  end

  def obtener_cartas_con_palo(palo)
    selected_cards = cards.select { |e| e.palo == palo }
    ColeccionCartas.new(selected_cards)
  end

  def palo_de_mayor_aparicion
    freq_palos = cards.each_with_object(Hash.new(0)) { |v, h| h[v.palo] += 1; }
    cards.max_by { |v| freq_palos[v] }.palo
  end

  def card_with_max_value
    cards.max_by(&:valor)
  end

  def each(&block)
    @cards.each(&block)
  end

  def length
    cards.length
  end

  attr_reader :cards
end

class ColeccionCartasTruco < ColeccionCartas
  def calcular_puntos_de_envido
    tanto = 0
    cards.each do |carta|
      tanto += carta.envido_value
    end
    tanto + 20
  end

  def obtener_cartas_con_palo(palo)
    selected_cards = cards.select { |e| e.palo == palo }
    ColeccionCartasTruco.new(selected_cards)
  end

  def card_with_max_value
    cards.max_by(&:envido_value)
  end
end
