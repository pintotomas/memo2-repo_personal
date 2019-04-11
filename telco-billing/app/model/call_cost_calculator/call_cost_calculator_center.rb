require_relative 'international_call_cost_calculator'
require_relative 'national_call_cost_calculator'
require_relative 'local_call_cost_calculator'
require_relative 'call_cost_calculator_constants'
class CallCostCalculatorCenter
  def initialize
    @international_call_cost_calculator = InternationalCallCostCalculator.new
    @national_call_cost_calculator = NationalCallCostCalculator.new
    @local_call_cost_calculator = LocalCallCostCalculator.new
  end

  def cost(call)
    same_country_calculators = { $same_area_code => @local_call_cost_calculator, $different_area_code => @national_call_cost_calculator }
    different_country_calculators = { $same_area_code => @international_call_cost_calculator,
                                      $different_area_code => @international_call_cost_calculator }

    who_costs_call = { $different_country_code => different_country_calculators, $same_country_code => same_country_calculators }
    destination = call.destination_country
    origin = call.origin_country
    origin_area_code = call.origin_area_code
    destination_area_code = call.destination_area_code

    who_costs_call[origin == destination][origin_area_code == destination_area_code].cost(call)
  end
end
