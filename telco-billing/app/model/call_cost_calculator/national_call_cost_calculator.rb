require_relative '../../aux/functions'
require_relative 'calculator_constants'
class NationalCallCostCalculator
  def initialize
    @base_cost = 20
    @free_minutes = 5
    @minute_cost = 1.5
  end

  def cost(call)
    start_time = call.start_time
    end_time = call.end_time
    minutes_elapsed = (end_time - start_time) / $one_minute_in_seconds
    minutes_elapsed_discounting_free_minutes = minutes_elapsed - @free_minutes
    max(@base_cost, (minutes_elapsed_discounting_free_minutes * @minute_cost) + @base_cost)
  end
end
