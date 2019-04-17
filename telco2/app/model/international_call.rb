class InternationalCall
  DAY_DURATION = 24
  HOUR_DURATION = 60
  MIN_COST_PER_COUNTRY_CODE = { '52' => 10, '55' => 6, '39' => 15 }.freeze

  attr_reader :start_date_time

  def initialize(phone_number_destiny, start_date_time, end_date_time)
    @phone_number_destiny = phone_number_destiny
    @country_code = phone_number_destiny.country_code
    @start_date_time = start_date_time
    @end_date_time = end_date_time
    @call_duration = ((end_date_time - start_date_time) * DAY_DURATION * HOUR_DURATION).to_i
  end

  def cost
    @call_duration * MIN_COST_PER_COUNTRY_CODE[@country_code]
  end
end
