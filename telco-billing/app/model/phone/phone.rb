require_relative 'phone_exceptions'
require_relative 'phone_constants'
class Phone
  def initialize(string_number_info)
    # receives a string containing the number information, the two first must be the country code,
    # the following three the area code and last, 8 numbers

    string_number_info = string_number_info.delete(" \t\r\n")
    raise PhoneNumberCannotContainCharactersError unless string_number_info.scan(/\D/).empty?
    raise PhonesMustBeThirteenDigitsError unless string_number_info.length == $phone_number_digits

    country_code = string_number_info[$country_code_start..$country_code_end]
    raise InvalidCountryCodeError unless $valid_country_codes.include? country_code

    area_code = string_number_info[$area_code_start..$area_code_end]
    number = string_number_info[$phone_number_start..$phone_number_end]

    @country_code = country_code
    @area_code = area_code
    @number = number
  end

  attr_reader :country_code
  attr_reader :area_code

  def phone_number
    @country_code + @area_code + @number
  end
end
