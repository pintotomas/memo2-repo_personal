class PhoneNumberCannotContainCharactersError < RuntimeError
end

class PhonesMustBeThirteenDigitsError < RuntimeError
end

class InvalidCountryCodeError < RuntimeError
end

class InvalidAreaCodeError < RuntimeError
end

class PhoneOriginNumberEqualsPhoneDestinationNumberError < RuntimeError
end
