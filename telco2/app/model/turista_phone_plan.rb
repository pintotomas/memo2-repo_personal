require_relative '../aux/functions'

class TuristaPhonePlan
  MINUTE_COST = 1.5
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
    20 + max((duration - 5) * MINUTE_COST, 0)
  end
end
