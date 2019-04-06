require_relative 'exceptions/phone_exceptions'
class Phone
  def initialize(string_number_info)
    # receives a string containing the number information, the two first must be the country code,
    # the following three the area code and last, 8 numbers
    phone_number_digits = 13
    valid_country_codes = %w[54 52 55 39]
    raise PhoneNumberCannotContainCharactersError unless string_number_info.scan(/\D/).empty?
    raise PhonesMustBeThirteenDigitsError unless string_number_info.length == phone_number_digits

    country_code_start = 0
    country_code_end = 1
    country_code = string_number_info[country_code_start..country_code_end]
    raise InvalidCountryCodeError unless valid_country_codes.include? country_code
  end
end
