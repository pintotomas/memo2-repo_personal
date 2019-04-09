require_relative 'call_exceptions'
require_relative '../exceptions/general_exceptions'
require 'time'
class Call
  def initialize(params)
    # params is a dictionary that contains the following keys:
    # origin and destination, both of Phone type
    # start and end, both time stamps
    @minute_counters = []
    @call_start_time = Time.parse(params['start'])
    @call_end_time = Time.parse(params['end'])
    @origin = params['origin']

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

  def month
    @call_start_time.month
  end

  def phone
    @origin.phone_number
  end

  def year
    @call_start_time.year
  end

  private

  def process_call
    raise SubclassResponsibility
  end
end
