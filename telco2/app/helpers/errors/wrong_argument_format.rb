require_relative 'request_input_error'

class WrongArgumentFormat < RequestInputError
  def initialize(msg = 'Error en el formato de un argumento')
    super
  end
end
