require_relative 'exceptions/phone_exceptions'
class Phone
  def initialize(string_number_info)
    # receives a string containing the number information, the two first must be the country code,
    # the following three the area code and last, 8 numbers
    phone_number_digits = 13

    raise PhoneNumberCannotContainCharactersError unless string_number_info.scan(/\D/).empty?
    raise PhonesMustBeThirteenDigitsError unless string_number_info.length == phone_number_digits

    country_code_start = 0
    country_code_end = 1
    country_code = string_number_info[country_code_start..country_code_end]
    validate_country_coude(country_code)

    area_code_start = 2
    area_code_end = 4
    area_code = string_number_info[area_code_start..area_code_end]
    validate_area_code(area_code)
  end

  private

  def validate_country_coude(country_code)
    valid_country_codes = %w[54 52 55 39]

    raise InvalidCountryCodeError unless valid_country_codes.include? country_code
  end

  # Rubocop me marca como useless poner un private aqui

  def validate_area_code(area_code)
    valid_area_codes = %w[011 314]
    raise InvalidAreaCodeError unless valid_area_codes.include? area_code
  end
end
