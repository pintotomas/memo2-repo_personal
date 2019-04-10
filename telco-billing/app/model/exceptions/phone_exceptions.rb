require_relative '../exceptions/telco_exceptions'
class PhoneNumberCannotContainCharactersError < TelcoException
  def initialize(msg = 'Invalid input for phone number information')
    super
  end
end

class PhonesMustBeThirteenDigitsError < TelcoException
  def initialize(msg = 'Invalid quantity of numbers for the phone number')
    super
  end
end

class InvalidCountryCodeError < TelcoException
  def initialize(msg = 'Invalid country code for the phone number')
    super
  end
end

class InvalidAreaCodeError < TelcoException
  def initialize(msg = 'Invalid area code for the phone number')
    super
  end
end

class PhoneOriginNumberEqualsPhoneDestinationNumberError < TelcoException
  def initialize(msg = 'A call cant be made with same origin and destination numbers')
    super
  end
end
