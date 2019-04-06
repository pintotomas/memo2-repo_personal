
class MinuteDetector
   @type_of_minute = {0 => 'week_night_minutes', 1 => 'week_night_minutes', 2 => 'week_night_minutes', 3 => 'week_night_minutes', 4 => 'week_night_minutes', 5 => 'week_night_minutes',
     6 => 'week_night_minutes', 7 => 'week_night_minutes', 8 => 'week_day_minutes', 9 => 'week_day_minutes', 10 => 'week_day_minutes', 11 => 'week_day_minutes', 12 => 'week_day_minutes',
     13 => 'week_day_minutes', 14 => 'week_day_minutes', 15 => 'week_day_minutes', 16 => 'week_day_minutes', 17 => 'week_day_minutes', 18 => 'week_day_minutes', 19 => 'week_day_minutes',
     20 => 'week_night_minutes', 21 => 'week_night_minutes', 22 => 'week_night_minutes', 23 => 'week_night_minutes'}

     def self.differentiate_call_minutes(call_start_time, call_end_time)
      #Returns a dictionary which has the count of how many of the minutes of the call were made on weekend, 
      #weekday during daylight or during night(Night is considered from 20pm to 8am).
      minutes_result = {'week_night_minutes'=>0, 'week_day_minutes'=>0, 'weekend_minutes'=>0}
      actual_call_time_aux = call_start_time
      minute_increment = 60
      while actual_call_time_aux < call_end_time
        actual_call_time_aux += minute_increment  

        if actual_call_time_aux.sunday? || actual_call_time_aux.saturday?
          minutes_result['weekend_minutes'] = minutes_result['weekend_minutes'] + 1
        else 
          minutes_result[@type_of_minute[actual_call_time_aux.hour]] = minutes_result[@type_of_minute[actual_call_time_aux.hour]] + 1
        end
      end
      minutes_result
     end
end