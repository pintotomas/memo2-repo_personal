require_relative 'call_exceptions'
require_relative '../exceptions/general_exceptions'
require 'time'
class Call
  def initialize(call_start_time, call_end_time, origin, destination)
    @minute_counters = []
    @call_start_time = Time.parse(call_start_time)
    @call_end_time = Time.parse(call_end_time)
    @origin = origin
    @destination = destination

    raise CallEndTimeBeforeStartTimeError unless @call_start_time < @call_end_time
  rescue ArgumentError
    raise InvalidCallStartOrEndTimeError
  end

  def cost
    total_cost = 0
    @minute_counters.each do |counter|
      total_cost += counter.cost
    end
    total_cost
  end

  private

  def process_call
    raise SubclassResponsibility
  end
end
