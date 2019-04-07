class TimeAux
  # Contains auxiliary methods for working with Time objects from library 'time'
  @minute_increment = 60
  def self.count_minutes(time_start, time_end, params, minute_counter)
    # minute_counter is a MinuteCOunter object
    # time_start and time_end must be Time objects
    # Counts the minutes between time_start and time_end that satisfy params
    # params must be a dictionary with the format {day => {since => a, until => a}}
    # day must be an integer that maps to the week day following the Time gem convention
    # a and b must be the hours that you want to consider from the day 'day'
    # increments minute_counter when a time meets the requirements in params
    aux_time = time_start
    while aux_time < time_end
      actual_day = aux_time.wday
      actual_hour = aux_time.hour
      if params.key? actual_day

        start_hour_limit = params[actual_day]['since']
        end_hour_limit = params[actual_day]['until']
        minute_counter.inc if actual_hour.between?(start_hour_limit, end_hour_limit)
      end
      aux_time += @minute_increment

    end
  end
end
