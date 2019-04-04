require 'time'
class Telco
  def call_cost(call_start_time, call_end_time)
    # Returns call cost
    call_start_time_parsed = Time.parse(call_start_time)
    call_end_time_parsed = Time.parse(call_end_time)
    difference = call_end_time_parsed - call_start_time_parsed
    difference_in_minutes = difference / 60
    return difference_in_minutes * 2.1 if call_start_time_parsed.saturday? ||
                                          call_start_time_parsed.sunday?
    return difference_in_minutes * 3.2 if call_start_time_parsed.hour < 20

    1.8
  end
end
