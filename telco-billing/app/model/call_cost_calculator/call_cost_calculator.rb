class CallCostCalculator
  def initialize
    @international_call_cost_calculator = MinuteCostCalculator.new(1)
    @national_call_cost_calculator = MinuteCostCalculator.new(1)
    @local_call_cost_calculator = MinuteCostCalculator.new(1)
  end

  def cost(call); end
end
