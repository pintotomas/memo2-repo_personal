require_relative 'call_error'

class CallEndBeforeStartError < CallError
  def initialize(msg = 'La fecha de fin es anterior a la de comienzo')
    super
  end
end
