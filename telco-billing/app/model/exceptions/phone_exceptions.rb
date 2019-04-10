class PhoneNumberCannotContainCharactersError < RuntimeError
  def initialize(msg = 'Invalid input for phone number information')
    super
  end
end

class PhonesMustBeThirteenDigitsError < RuntimeError
  def initialize(msg = 'Invalid quantity of numbers for the phone number')
    super
  end
end

class InvalidCountryCodeError < RuntimeError
  def initialize(msg = 'Invalid country code for the phone number')
    super
  end
end

class InvalidAreaCodeError < RuntimeError
  def initialize(msg = 'Invalid area code for the phone number')
    super
  end
end

class PhoneOriginNumberEqualsPhoneDestinationNumberError < RuntimeError
  def initialize(msg = 'A call cant be made with same origin and destination numbers')
    super
  end
end
