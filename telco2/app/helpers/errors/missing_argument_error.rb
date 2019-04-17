require_relative 'request_input_error'

class MissingArgumentError < RequestInputError
  def initialize(msg = 'Faltan un argumento en el request')
    super
  end
end
