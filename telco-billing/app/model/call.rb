require 'time'
require_relative 'exceptions/call_exceptions'
class Call
  def initialize(call_start_time, call_end_time)
    # call_start_time and call_end_time must have yyyymmdd;hhmm
    @call_start_time = Time.parse(call_start_time)
    @call_end_time = Time.parse(call_end_time)
    raise CallEndTimeBeforeStartTimeError unless @call_start_time < @call_end_time
  rescue ArgumentError
    raise InvalidCallStartOrEndTimeError
  end

  def duration
    # returns the duration of the call, in seconds
    @call_end_time - @call_start_time
  end

  def saturday
    @call_start_time.saturday?
  end

  def sunday
    @call_start_time.sunday?
  end
end
