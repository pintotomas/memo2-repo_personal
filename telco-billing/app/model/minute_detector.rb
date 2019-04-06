class MinuteDetector
  # These two first hashes are used for counting minutes of the call,
  # a minute of a call during sunday should not be considered for the counting of minutes during week

  @weekend_days = { 0 => 1, 6 => 1, 1 => 0, 2 => 0, 3 => 0, 4 => 0, 5 => 0 }
  @week_days = { 0 => 0, 6 => 0, 1 => 1, 2 => 1, 3 => 1, 4 => 1, 5 => 1 }

  # Local calls should be differentiated if it transcurs during night or day in a week day.
  @type_of_minute = { 0 => 'week_night_min', 1 => 'week_night_min',
                      2 => 'week_night_min', 3 => 'week_night_min', 4 => 'week_night_min',
                      5 => 'week_night_min', 6 => 'week_night_min', 7 => 'week_night_min',
                      8 => 'week_day_min', 9 => 'week_day_min', 10 => 'week_day_min',
                      11 => 'week_day_min', 12 => 'week_day_min',
                      13 => 'week_day_min', 14 => 'week_day_min', 15 => 'week_day_min',
                      16 => 'week_day_min', 17 => 'week_day_min', 18 => 'week_day_min',
                      19 => 'week_day_min', 20 => 'week_night_min',
                      21 => 'week_night_min', 22 => 'week_night_min', 23 => 'week_night_min' }

  def self.differentiate_call_minutes(call_start_time, call_end_time)
    # Returns a dictionary which has the count of how many of the minutes of the call were
    # made on weekend,
    # weekday during daylight or during night(Night is considered from 20pm to 8am).
    minutes_result = { 'week_night_min' => 0, 'week_day_min' => 0, 'weekend_min' => 0 }
    actual_call_time_aux = call_start_time
    minute_increment = 60
    while actual_call_time_aux < call_end_time
      minutes_result['weekend_min'] = minutes_result['weekend_min'] + (1 * @weekend_days[actual_call_time_aux.wday])
      minutes_result[@type_of_minute[actual_call_time_aux.hour]] =
        minutes_result[@type_of_minute[actual_call_time_aux.hour]] + (1 * @week_days[actual_call_time_aux.wday])

      actual_call_time_aux += minute_increment
    end
    minutes_result
  end
end
