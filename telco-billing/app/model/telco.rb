require 'time'
require_relative 'call/call_factory'

class Telco
  def initialize
    @call_factory = CallFactory.new
    @call_registry = []
  end

  def call_cost(call_info)
    # Returns call cost
    call = @call_factory.new_call(call_info)
    @call_registry << call
    call.cost
  end

  def bill(billing_info)
    phone = billing_info['number']
    year = billing_info['year_month'][0..3].to_i
    month = billing_info['year_month'][4..5].to_i
    result = @call_registry.select do |call|
      (call.year == year) &&
        (call.month == month) &&
        (call.phone == phone)
    end
    total_cost = 0
    result.each do |call|
      total_cost += call.cost
    end
    calls_made = result.length
    [calls_made, total_cost]
  end
end
