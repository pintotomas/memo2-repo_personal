require 'time'
require_relative 'call/call'
require_relative 'call/call_registry'
require_relative 'biller/biller'
require_relative 'phone/phone'
require_relative 'call_cost_calculator/call_cost_calculator_center'
require_relative '../aux/functions'
require_relative 'exceptions/telco_exceptions'

class Telco
  def initialize
    @call_registry = CallRegistry.new
    base_cost = 100
    @biller = Biller.new(base_cost)
    @call_cost_calculator = CallCostCalculatorCenter.new
  end

  def register_call(call_info)
    call = Call.new(Phone.new(call_info['numero_origen']), Phone.new(call_info['numero_destino']),
                    call_info['fechahora_inicio'], call_info['fechahora_fin'])
    @call_registry.push(call)
  end

  def call_cost(call_info)
    # Returns call cost
    call = Call.new(Phone.new(call_info['numero_origen']), Phone.new(call_info['numero_destino']),
                    call_info['fechahora_inicio'], call_info['fechahora_fin'])
    #  @call_registry.push(call)
    @call_cost_calculator.cost(call)
  end

  def bill(billing_info)
    phone = Phone.new(billing_info['number'])
    year = billing_info['year_month'][0..3]
    month = billing_info['year_month'][4..5]
    raise InvalidBillingYear unless is_number? year
    raise InvalidBillingMonth unless is_number? month

    year = year.to_i
    month = month.to_i
    corresponding_calls = @call_registry.select { |call| call.phone == phone.phone_number && call.month == month && call.year == year }
    @biller.make_bill(corresponding_calls, @call_cost_calculator)
  end
end
