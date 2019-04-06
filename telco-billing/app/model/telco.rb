require 'time'
class Telco
  #  def call_cost(call_start_time, call_end_time)
  def call_cost(call)
    # Returns call cost
    # to do: delegate to CallCostCalculator
    weekday_night_cost = 1.8
    weekday_day_cost = 3.2
    weekends_cost = 2.1
    weekend_cost = call.weekend_minutes * weekends_cost
    week_day_cost = call.week_day_minutes * weekday_day_cost
    week_night_cost = call.week_night_minutes * weekday_night_cost
    weekend_cost + week_night_cost + week_day_cost
  end
end
