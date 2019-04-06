class MinuteDetector
  def self.differentiate_call_minutes(call_start_time, call_end_time)
    # Returns a dictionary which has the count of how many of the
    # minutes of the call were made on weekend,
    # weekday during daylight or during night(Night is considered from 20pm to 8am).
    minutes_result = { 'weekend_minutes' => 0 }
    actual_call_time_aux = call_start_time
    minute_increment = 60
    while actual_call_time_aux < call_end_time
      actual_call_time_aux += minute_increment

      if actual_call_time_aux.sunday? || actual_call_time_aux.saturday?
        minutes_result['weekend_minutes'] =
          minutes_result['weekend_minutes'] + 1
      end

    end
    minutes_result
  end
end
