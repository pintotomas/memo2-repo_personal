class RequestInputError < RuntimeError
  def initialize(msg = 'Error en el request')
    super
  end
end
