require_relative 'exceptions/phone_exceptions'
class Phone
  def initialize(string_number_info)
    # receives a string containing the number information, the two first must be the country code,
    # the following three the area code and last, 8 numbers

    # delete spaces
    string_number_info = string_number_info.delete(" \t\r\n")
    valide_input(string_number_info)
    country_code_start = 0
    country_code_end = 1
    country_code = string_number_info[country_code_start..country_code_end]
    validate_country_coude(country_code)

    area_code_start = 2
    area_code_end = 4
    area_code = string_number_info[area_code_start..area_code_end]
    validate_area_code(area_code)

    phone_number_start = 5
    phone_number_end = 12
    phone_number = string_number_info[phone_number_start..phone_number_end]

    @country_code = country_code
    @area_code = area_code
    @phone_number = phone_number
  end

  attr_reader :country_code
  attr_reader :area_code

  def same_country(other_phone)
    @country_code == other_phone.country_code
  end

  def same_area_code(other_phone)
    @area_code == other_phone.area_code
  end

  private

  def validate_country_coude(country_code)
    valid_country_codes = %w[54 52 55 39]

    raise InvalidCountryCodeError unless valid_country_codes.include? country_code
  end

  def validate_area_code(area_code)
    valid_area_codes = %w[011 314]
    raise InvalidAreaCodeError unless valid_area_codes.include? area_code
  end

  def valide_input(input)
    phone_number_digits = 13
    raise PhoneNumberCannotContainCharactersError unless input.scan(/\D/).empty?
    raise PhonesMustBeThirteenDigitsError unless input.length == phone_number_digits
  end
end
