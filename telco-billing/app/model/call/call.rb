require_relative 'call_exceptions'
require_relative '../exceptions/general_exceptions'
require 'time'
class Call
  def initialize(origin, destination, start_time_stamp, end_time_stamp)
    # params is a dictionary that contains the following keys:
    # origin and destination, both of Phone type
    # start and end, both time stamps
    @call_start_time = Time.parse(start_time_stamp)
    @call_end_time = Time.parse(end_time_stamp)
    raise PhoneOriginNumberEqualsPhoneDestinationNumberError unless origin.phone_number != destination.phone_number

    @origin = origin
    @destination = destination
    raise CallEndTimeBeforeStartTimeError unless @call_start_time < @call_end_time
  rescue ArgumentError
    raise InvalidCallStartOrEndTimeError
  end
  attr_reader :call_start_time
  attr_reader :call_end_time

  def month
    @call_start_time.month
  end

  def phone
    @origin.phone_number
  end

  def year
    @call_start_time.year
  end

  def origin_country
    @origin.country_code
  end

  def destination_country
    @destination.country_code
  end

  def origin_area_code
    @origin.area_code
  end

  def destination_area_code
    @destination.area_code
  end
end
