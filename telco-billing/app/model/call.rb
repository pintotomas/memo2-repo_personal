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
end
