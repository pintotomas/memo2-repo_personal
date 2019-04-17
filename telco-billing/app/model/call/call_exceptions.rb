require_relative '../exceptions/telco_exceptions'
class InvalidCallStartOrEndTimeError < TelcoException
  def initialize(msg = 'Invalid start or end time for the call')
    super
  end
end

class CallEndTimeBeforeStartTimeError < TelcoException
  def initialize(msg = "The call can't end before it starts!")
    super
  end
end
