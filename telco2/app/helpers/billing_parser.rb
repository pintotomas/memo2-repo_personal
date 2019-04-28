require_relative 'billing_validator'

class BillingParser
  attr_reader :number
  attr_reader :month

  def parse(params)
    billing_validator = BillingValidator.new
    billing_validator.validate_input(params)

    @number = params['numero'].delete(' ')
    @month = params['mes']
  end
end
