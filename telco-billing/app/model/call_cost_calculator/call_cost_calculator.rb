require_relative 'international_call_cost_calculator'
require_relative 'national_call_cost_calculator'
class CallCostCalculator
  def initialize
    @international_call_cost_calculator = InternationalCallCostCalculator.new
    @national_call_cost_calculator = NationalCallCostCalculator.new
    # @local_call_cost_calculator = MinuteCostCalculator.new(1)
  end

  def cost(call)
    who_costs_call = { false => @international_call_cost_calculator, true => @national_call_cost_calculator }
    destination = call.destination_country
    origin = call.origin_country
    who_costs_call[origin == destination].cost(call)
  end
end
