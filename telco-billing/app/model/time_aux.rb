class TimeAux
  # Contains auxiliary methods for working with Time objects from library 'time'
  @minute_increment = 60
  def self.count_minutes(_t1, _t2, _params, minute_counter)
    # minute_counter is a MinuteCOunter object
    # t1 and t2 must be Time objects
    # Counts the minutes between t1 and t2 that satisfy params
    # params must be a dictionary with the format {day => {since => a, until => a}}
    # day must be an integer that maps to the week day following the Time gem convention
    # a and b must be the hours that you want to consider from the day 'day'
    # increments minute_counter when a time meets the requirements in params
    minute_counter.inc
  end
end
