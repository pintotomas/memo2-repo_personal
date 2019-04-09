require_relative 'international_call_cost_calculator'

class CallCostCalculator
  def initialize
    @international_call_cost_calculator = InternationalCallCostCalculator.new
    @national_call_cost_calculator = MinuteCostCalculator.new(1)
    @local_call_cost_calculator = MinuteCostCalculator.new(1)
  end

  def cost(call)
    @international_call_cost_calculator.cost(call)
  end
end
