require_relative 'call_error'

class PhoneDestinySamePhoneOriginError < CallError
  def initialize(msg = 'El numero de destino es el mismo que el de origen')
    super
  end
end
