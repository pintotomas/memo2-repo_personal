require_relative '../phone'
require_relative 'international_call'
require_relative 'local_call'
require_relative 'national_call'
class CallFactory
  def new_call(call_info)
    # call_info is a dictionary with the following keys:
    # 'numero_origen', 'numero_destino', 'fechahora_inicio', 'fechahora_fin'
    # returns a call depending on these parameters.
    # could be local call, national call or international call.

    call_classes =
      # If area codes are equal, we have a local or national call
      { true => { false => NationalCall, true => LocalCall },
        # If country codes are different, the area code doesnt matter
        false => { false => InternationalCall, true => InternationalCall } }

    origin = Phone.new(call_info[:numero_origen])
    destination = Phone.new(call_info[:numero_destino])
    start_time_stamp = call_info[:fechahora_inicio]
    end_time_stamp = call_info[:fechahora_fin]
    call = call_classes[origin.same_country(destination)][origin.same_area_code(destination)]
    call.new(start_time_stamp, end_time_stamp)
  end
end
