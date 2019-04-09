require 'time'
require_relative 'call/call_factory'
require_relative 'call/call_registry'
require_relative 'biller'
class Telco
  def initialize
    @call_factory = CallFactory.new
    @call_registry = CallRegistry.new
    base_cost = 100
    @biller = Biller.new(base_cost)
  end

  def call_cost(call_info)
    # Returns call cost
    call = @call_factory.new_call(call_info)
    @call_registry.push(call)
    call.cost
  end

  def bill(billing_info)
    phone = billing_info['number'].gsub(/\s+/, '')
    year = billing_info['year_month'][0..3].to_i
    month = billing_info['year_month'][4..5].to_i
    corresponding_calls = @call_registry.select { |call| call.phone == phone && call.month == month && call.year == year }
    @biller.make_bill(corresponding_calls)

  end
end
