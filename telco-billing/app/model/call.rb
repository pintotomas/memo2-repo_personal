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
    @weekday_night_cost = 1.8
    @weekday_day_cost = 3.2
    @weekends_cost = 2.1
    raise CallEndTimeBeforeStartTimeError unless @call_start_time < @call_end_time
  rescue ArgumentError
    raise InvalidCallStartOrEndTimeError
  end

  def cost
    weekend_cost = @weekend_minutes * @weekends_cost
    week_day_cost = @week_day_minutes * @weekday_day_cost
    week_night_cost = @week_night_minutes * @weekday_night_cost
    weekend_cost + week_night_cost + week_day_cost
  end

  attr_reader :weekend_minutes

  attr_reader :week_night_minutes
  attr_reader :week_day_minutes
  def duration
    # returns the duration of the call, in seconds
    @call_end_time - @call_start_time
  end
end
