require_relative '../aux/functions'

class TuristaPhonePlan
  MINUTE_COST = 1.5
  MINIMUN_COST = 20
  MIN_COST_UNTIL = 5 # minutes
  ZERO = 0
  def initialize(country_code)
    @country_code = country_code
    @base_cost = 300
    @name = 'turista'
  end
  attr_reader :base_cost
  attr_reader :name
  def cost(call)
    return call.cost unless call.phone_number_destiny.country_code == @country_code

    duration = call.total_duration
    MINIMUN_COST + max((duration - MIN_COST_UNTIL) * MINUTE_COST, ZERO)
  end
end
