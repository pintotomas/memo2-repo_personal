require 'time'
class Telco
  def call_cost(inicio, _fin)
    # Returns call cost
    time_stamp = Time.parse(inicio)
    return 2.1 if time_stamp.saturday? || time_stamp.sunday?
    return 3.2 if time_stamp.hour < 20

    1.8
  end
end
