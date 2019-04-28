require_relative 'errors/missing_argument_error'
require_relative 'errors/wrong_argument_format'

class CallValidator
  PHONE_FORMAT = /^\d{13,13}$/.freeze
  DATE_FORMAT = /^\d{8,8};\d{2,2}:\d{2,2}$/.freeze

  def validate_input(input)
    validate_input_names(input)
    validate_input_fields(input)
  end

  private

  def validate_input_names(input)
    raise MissingArgumentError, 'Falta fechahora inicio' unless input.include?('fechahora_inicio')
    raise MissingArgumentError, 'Falta fechahora fin' unless input.include?('fechahora_fin')
    raise MissingArgumentError, 'Falta numero origen' unless input.include?('numero_origen')
    raise MissingArgumentError, 'Falta numero destino' unless input.include?('numero_destino')
  end

  def validate_input_fields(input)
    validate_phone_numbers(input)
    validate_dates(input)
  end

  def validate_phone_numbers(input)
    phone_origin = input['numero_origen'].delete(' ')
    phone_destiny = input['numero_destino'].delete(' ')

    raise WrongArgumentFormat, 'Error en el formato de numero origen' unless
      phone_origin.match(PHONE_FORMAT)
    raise WrongArgumentFormat, 'Error en el formato de numero destino' unless
      phone_destiny.match(PHONE_FORMAT)
  end

  def validate_dates(input)
    start_date = input['fechahora_inicio']
    end_date = input['fechahora_fin']

    raise WrongArgumentFormat, 'Error en el formato de fechahora inicio' unless
      start_date.match(DATE_FORMAT)
    raise WrongArgumentFormat, 'Error en el formato de fechahora fin' unless
      end_date.match(DATE_FORMAT)
  end
end
