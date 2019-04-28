require_relative 'hour_cost'

class CentralHourCost < HourCost
  COST_PER_MINUTE = 3.2

  def cost_per_minute
    COST_PER_MINUTE
  end
end
