class NationalCall
  DAY_DURATION = 24
  HOUR_DURATION = 60
  MINIMUM_COST = 20
  MAX_DURATION_MIN_COST = 5
  COST_PER_MINUTE = 1.5

  attr_reader :start_date_time
  attr_reader :phone_number_destiny
  
  def initialize(phone_number_destiny, start_date_time, end_date_time)
    @phone_number_destiny = phone_number_destiny
    @start_date_time = start_date_time
    @end_date_time = end_date_time
    @call_duration = ((end_date_time - start_date_time) * DAY_DURATION * HOUR_DURATION).to_i
  end

  def cost
    if @call_duration > MAX_DURATION_MIN_COST
      (@call_duration - MAX_DURATION_MIN_COST) * COST_PER_MINUTE + MINIMUM_COST
    else
      MINIMUM_COST
    end
  end
end
