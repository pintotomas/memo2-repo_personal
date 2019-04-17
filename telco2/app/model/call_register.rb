class CallRegister
  def initialize
    @calls = {}
  end

  def add_call(call)
    month = call.start_date_time.strftime('%Y%m')

    month_calls = find_or_create_month_calls(month)
    month_calls.push(call)

    @calls[month] = month_calls
  end

  def has_calls?(month)
    @calls.include?(month)
  end

  def get_month_calls(month)
    @calls[month]
  end

  private

  def find_or_create_month_calls(month)
    return @calls[month] if @calls.include?(month)

    []
  end
end
