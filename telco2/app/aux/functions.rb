def count_seconds(time_start, time_end, params)
  # time_start and time_end must be Time objects
  # Counts the seconds between time_start and time_end that satisfy params
  # params must be a dictionary with the format {day => {since => a, until => a}}
  # day must be an integer that maps to the week day following the Time gem convention
  # a and b must be the hours that you want to consider from the day 'day'
  # returns how many seconds satisfy params between time_start and time_end
  minute_increment_in_seconds = 60
  aux_time = time_start
  seconds_counter = 0
  while aux_time < time_end
    actual_day = aux_time.wday
    actual_hour = aux_time.hour
    if params.key? actual_day

      start_hour_limit = params[actual_day]['since']
      end_hour_limit = params[actual_day]['until']
      seconds_counter += 60 if actual_hour.between?(start_hour_limit, end_hour_limit)
    end
    aux_time += minute_increment_in_seconds
  end
  seconds_counter
end