require_relative 'errors/missing_argument_error'
require_relative 'errors/wrong_argument_format'

class PlansValidator
  VALID_PLANS = %w[amigos turista].freeze
  PHONE_FORMAT = /^\d{13,13}$/.freeze

  def validate_input(input)
    validate_input_names(input)
    validate_input_plan(input)
    validate_amigos_plan_parameter(input) if input['plan'] == 'amigos'
    validate_turista_plan_parameters(input) if input['plan'] == 'turista'
  end

  private

  def validate_input_names(input)
    raise MissingArgumentError, 'Missing plan name' unless input.include?('plan')
    raise MissingArgumentError, 'Missing number to register the plan' unless input.include?('numero')
  end

  def validate_input_plan(input)
    raise WrongArgumentFormat, 'Non-existing plan' unless VALID_PLANS.include?(input['plan'])
  end

  def validate_amigos_plan_parameter(input)
    raise MissingArgumentError, 'Missing amigos numbers parameter for amigos plan' unless input.include?('amigos')

    friend_numbers = input['amigos'].split(',')
    friend_numbers.each do |number|
      raise WrongArgumentFormat, 'Wrong friend number format' unless number.match(PHONE_FORMAT)
    end
  end

  def validate_turista_plan_parameters(input)
    raise MissingArgumentError, 'Missing country code number parameter for turista plan' unless input.include?('pais')
  end
end
