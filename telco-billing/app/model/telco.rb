require 'time'
class Telco
  def initialize
    @call_factory = CallFactory.new
  end

  def call_cost(call_info)
    # Returns call cost
    call = @call_factory.new_call(call_info)
    call.cost
  end
end
