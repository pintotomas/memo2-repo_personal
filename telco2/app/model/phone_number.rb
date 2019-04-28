require_relative 'local_call'
require_relative 'national_call'
require_relative 'international_call'
require_relative 'call_register'
require_relative 'errors/phone_destiny_same_phone_origin_error'
require_relative 'errors/call_end_before_start_error'

class PhoneNumber
  attr_reader :number
  attr_reader :country_code
  attr_reader :regional_code

  DAY_DURATION = 24
  HOUR_DURATION = 60

  def initialize(number)
    @number = number
    @country_code = number[0, 2]
    @regional_code = number[2, 3]
    @call_register = CallRegister.new
  end

  def make_call(phone_number_destiny, start_date_time, end_date_time)
    call = create_call(phone_number_destiny, start_date_time, end_date_time)

    @call_register.add_call(call)

    call.cost
  end

  def get_calls_by_month(month)
    @call_register.get_month_calls(month)
  end

  def has_calls?(month)
    @call_register.has_calls?(month)
  end

  private

  def create_call(phone_number_destiny, start_date_time, end_date_time)
    validate_call(phone_number_destiny, start_date_time, end_date_time)
    if @country_code != phone_number_destiny.country_code
      InternationalCall.new(phone_number_destiny, start_date_time, end_date_time)
    elsif @regional_code != phone_number_destiny.regional_code
      NationalCall.new(phone_number_destiny, start_date_time, end_date_time)
    else
      LocalCall.new(phone_number_destiny, start_date_time, end_date_time)
    end
  end

  def validate_call(phone_number_destiny, start_date_time, end_date_time)
    validate_destiny(phone_number_destiny)
    validate_date(start_date_time, end_date_time)
  end

  def validate_destiny(phone_destiny)
    raise PhoneDestinySamePhoneOriginError if @number == phone_destiny.number
  end

  def validate_date(start_date_time, end_date_time)
    raise CallEndBeforeStartError if end_date_time - start_date_time < 0
  end
end
