require 'time'
require_relative 'exceptions/call_exceptions'
require_relative 'minute_detector'
class Call
  def initialize(call_start_time, call_end_time)
    # call_start_time and call_end_time must have yyyymmdd;hhmm
    @call_start_time = Time.parse(call_start_time)
    @call_end_time = Time.parse(call_end_time)
    minutes_elapsed = MinuteDetector.differentiate_call_minutes(@call_start_time, @call_end_time)
    @weekend_minutes = minutes_elapsed['weekend_min']
    @week_day_minutes = minutes_elapsed['week_day_min']
    @week_night_minutes = minutes_elapsed['week_night_min']

    raise CallEndTimeBeforeStartTimeError unless @call_start_time < @call_end_time
  rescue ArgumentError
    raise InvalidCallStartOrEndTimeError
  end
  attr_reader :weekend_minutes

  attr_reader :week_night_minutes
  attr_reader :week_day_minutes
  def duration
    # returns the duration of the call, in seconds
    @call_end_time - @call_start_time
  end
end
