require_relative 'hour_cost'

class RegularHourCost < HourCost
  COST_PER_MINUTE = 1.8

  def cost_per_minute
    COST_PER_MINUTE
  end
end
