class InvalidCallStartOrEndTimeError < RuntimeError
  def initialize(msg = 'Invalid start or end time for the call')
    super
  end
end

class CallEndTimeBeforeStartTimeError < RuntimeError
  def initialize(msg = "The call can't end before it starts!")
    super
  end
end
