require 'time'
class Telco
  def call_cost(call_start_time, call_end_time)
    # Returns call cost
    weekday_night_cost = 1.8
    weekday_day_cost = 3.2
    night_start_time = 20
    weekends_cost = 2.1
    one_minute = 60
    call_start_time_parsed = Time.parse(call_start_time)
    call_end_time_parsed = Time.parse(call_end_time)
    difference = call_end_time_parsed - call_start_time_parsed
    difference_in_minutes = difference / one_minute
    return difference_in_minutes * weekends_cost if call_start_time_parsed.saturday? ||
                                                    call_start_time_parsed.sunday?
    return difference_in_minutes * weekday_day_cost if call_start_time_parsed.hour <
                                                       night_start_time

    difference_in_minutes * weekday_night_cost
  end
end
