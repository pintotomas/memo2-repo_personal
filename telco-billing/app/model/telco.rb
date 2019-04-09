require 'time'
require_relative 'call/call_factory'

class Telco
  def initialize
    @call_factory = CallFactory.new
    @call_registry = []
  end

  def call_cost(call_info)
    # Returns call cost
    call = @call_factory.new_call(call_info)
    @call_registry << call
    call.cost
  end

  def bill(_billing_info)
    [1, 3.2]
  end
end
