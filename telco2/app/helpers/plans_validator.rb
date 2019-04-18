require_relative 'errors/missing_argument_error'
require_relative 'errors/wrong_argument_format'

class PlansValidator
  VALID_PLANS = %w[amigos turista].freeze

  def validate_input(input)
    validate_input_names(input)
    validate_input_plan(input)
  end

  private

  def validate_input_names(input)
    raise MissingArgumentError, 'Missing plan name' unless input.include?('plan')
    raise MissingArgumentError, 'Missing number to register the plan' unless input.include?('numero')
  end

  def validate_input_plan(input)
    raise WrongArgumentFormat, 'Non-existing plan' unless VALID_PLANS.include?(input['plan'])
  end
end
