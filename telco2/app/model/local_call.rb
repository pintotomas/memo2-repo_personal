require_relative 'central_hour_cost'
require_relative 'regular_hour_cost'
require_relative 'weekend_hour_cost'
require_relative 'hour_handler'

class LocalCall
  attr_reader :start_date_time

  def initialize(phone_number_destiny, start_date_time, end_date_time)
    @phone_number_destiny = phone_number_destiny
    @start_date_time = start_date_time
    @end_date_time = end_date_time

    @call_hour = check_hour_band
  end

  def cost
    @call_hour.cost
  end

  private

  def check_hour_band
    hour_handler = HourHandler.new
    hour_handler.create_hour(@start_date_time, @end_date_time)
  end
end
