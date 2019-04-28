require_relative 'hour_cost'

class WeekendHourCost < HourCost
  COST_PER_MINUTE = 2.1

  def cost_per_minute
    COST_PER_MINUTE
  end
end
