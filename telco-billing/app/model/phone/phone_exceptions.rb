class PhoneNumberCannotContainCharactersError < TelcoException
end

class PhonesMustBeThirteenDigitsError < TelcoException
end

class InvalidCountryCodeError < TelcoException
end

class PhoneOriginNumberEqualsPhoneDestinationNumberError < TelcoException
end
