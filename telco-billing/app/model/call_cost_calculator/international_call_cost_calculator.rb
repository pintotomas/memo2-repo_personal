require_relative '../../aux/functions'

class InternationalCallCostCalculator
  def initialize
    @costs = { '52' => 10, '55' => 6, '39' => 15 }
  end

  def cost(call)
    # destination = call.destination
  end
end
