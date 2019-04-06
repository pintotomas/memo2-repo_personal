require_relative 'exceptions/phone_exceptions'
class Phone
  def initialize(string_number_info)
    # receives a string containing the number information, the two first must be the country code,
    # the following three the area code and last, 8 numbers
    phone_number_digits = 13
    raise PhoneNumberCannotContainCharactersError unless string_number_info.scan(/\D/).empty?
    raise PhonesMustBeThirteenDigitsError unless string_number_info.length == phone_number_digits
  end
end
