require 'time'
class Telco
  #  def call_cost(call_start_time, call_end_time)
  def call_cost(call)
    # Returns call cost
    # to do: delegate to CallCostCalculator
    weekday_night_cost = 1.8
    weekday_day_cost = 3.2
    night_start_time = 20
    weekends_cost = 2.1
    one_minute = 60
    difference = call.duration
    difference_in_minutes = difference / one_minute
    return difference_in_minutes * weekends_cost if call.started_weekend
    return difference_in_minutes * weekday_day_cost if call.ended_before(night_start_time)

    difference_in_minutes * weekday_night_cost
  end
end
