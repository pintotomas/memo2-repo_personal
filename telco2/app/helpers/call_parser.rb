require_relative 'call_validator'

class CallParser
  def new_call(client_organizer, input)
    validator = CallValidator.new

    validator.validate_input(input)

    start_date_time = DateTime.strptime(input['fechahora_inicio'], '%Y%m%d;%H:%M')
    end_date_time = DateTime.strptime(input['fechahora_fin'], '%Y%m%d;%H:%M')

    phone_number_origin = client_organizer.find_or_create_phone(input['numero_origen'].delete(' '))
    phone_number_destiny = client_organizer.find_or_create_phone(input['numero_destino'].delete(' '))

    phone_number_origin.make_call(phone_number_destiny, start_date_time, end_date_time)
  end
end
