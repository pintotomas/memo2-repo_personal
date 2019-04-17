class CallError < RuntimeError
  def initialize(msg = 'Error en la llamada')
    super
  end
end
