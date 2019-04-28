require_relative 'phones_organizer'

class Billing
  def initialize(phone_organizer)
    @phone_organizer = phone_organizer
  end

  def calculate_price(number, month)
    phone_number = @phone_organizer.find_or_create_phone(number)
    active_plan = @phone_organizer.plan(number)
    return active_plan.base_cost unless phone_number.has_calls?(month)

    monthly_calls = phone_number.get_calls_by_month(month)
    active_plan.base_cost + monthly_calls.inject(0) { |sum, call| sum + active_plan.cost(call) }
  end

  def call_quantity(number, month)
    phone_number = @phone_organizer.find_or_create_phone(number)

    return 0 unless phone_number.has_calls?(month)

    monthly_calls = phone_number.get_calls_by_month(month)
    monthly_calls.count
  end
end
