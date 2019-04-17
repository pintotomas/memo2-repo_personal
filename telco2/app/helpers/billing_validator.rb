require_relative 'errors/missing_argument_error'
require_relative 'errors/wrong_argument_format'

class BillingValidator
  PHONE_FORMAT = /^\d{13,13}$/.freeze
  MONTH_FORMAT = /^\d{6,6}$/.freeze

  def validate_input(input)
    validate_input_names(input)
    validate_input_fields(input)
  end

  def validate_input_names(input)
    raise MissingArgumentError, 'Falta numero' unless input.include?('numero')
    raise MissingArgumentError, 'Falta mes' unless input.include?('mes')
  end

  def validate_input_fields(input)
    validate_phone_number(input)
    validate_month(input)
  end

  def validate_phone_number(input)
    phone = input['numero'].delete(' ')

    raise WrongArgumentFormat, 'Error en el formato del numero' unless
      phone.match(PHONE_FORMAT)
  end

  def validate_month(input)
    month = input['mes']

    raise WrongArgumentFormat, 'Error en el formato del mes' unless
      month.match(MONTH_FORMAT)
  end
end
