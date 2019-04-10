class PhoneNumberCannotContainCharactersError < RuntimeError
end

class PhonesMustBeThirteenDigitsError < RuntimeError
end

class InvalidCountryCodeError < RuntimeError
end

class PhoneOriginNumberEqualsPhoneDestinationNumberError < RuntimeError
end
