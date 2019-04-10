class TelcoException < RuntimeError
end

class InvalidBillingYear < TelcoException
  def initialize(msg = 'Invalid billing year, must be a number')
    super
  end
end

class InvalidBillingMonth < TelcoException
  def initialize(msg = 'Invalid billing month, must be a number')
    super
  end
end
