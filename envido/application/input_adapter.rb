class InputAdapter
  def interpret(_input)
    # La idea es que quien herede esta clase interprete el input y lo devuelva
    # en esta aplicacion, toda interpretacion de distintos inputs deberia
    # devolver un string de la forma '03p,04o,10e' representando a las cartas
    raise NotImplementedError
  end
end

class ConsoleInputAdapter < InputAdapter
  # En este caso no hay nada que transformar, como leemos de consola directamente
  # lo devuelvo

  def initialize(input)
    @input = input
  end

  def read
    @input
  end
end
