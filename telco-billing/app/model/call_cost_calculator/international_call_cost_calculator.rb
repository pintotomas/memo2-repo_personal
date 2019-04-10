require_relative '../../aux/functions'
require_relative 'call_cost_constants'
class InternationalCallCostCalculator
  def initialize
    @costs = { '52' => 10, '55' => 6, '39' => 15 }
  end

  def cost(call)
    destination = call.destination_country
    start_time = call.call_start_time
    end_time = call.call_end_time
    minutes_elapsed = (end_time - start_time) / $one_minute_in_seconds
    minutes_elapsed * @costs[destination]
  end
end
