class ColeccionCartas
  # Representa a una mano de cartas
  def initialize(array_cartas)
    @cards = array_cartas
  end

  def obtener_cartas_con_palo(palo)
    selected_cards = cards.select { |e| e.palo == palo }
    # ColeccionCartas.new(selected_cards)
    @cards = selected_cards
    self
  end

  def frecuencia_palo_mayor_aparicion
    freq_palos = cards.each_with_object(Hash.new(0)) { |v, h| h[v.palo] += 1; }
    freq_palos.values.max
  end

  def palo_de_mayor_aparicion
    freq_palos = cards.each_with_object(Hash.new(0)) { |v, h| h[v.palo] += 1; }
    cards.max_by { |v| freq_palos[v] }.palo
  end

  def carta_maximo_valor(atr)
    # devuelve la carta de maximo valor de atr.
    cards.max_by(&atr)
  end

  def each(&block)
    @cards.each(&block)
  end

  def length
    cards.length
  end

  def sort(atr)
    # ordena segun atr
    # self.class.new(cards.sort_by(&atr).reverse)
    @cards = @cards.sort_by(&atr).reverse
    self
  end

  attr_reader :cards
end

class ColeccionCartasTruco < ColeccionCartas
  def calcular_puntos_de_envido(primeras_n_cartas = length)
    tanto = 0
    (0..primeras_n_cartas - 1).each do |i|
      tanto += cards[i].envido_value
    end
    tanto
  end
end
