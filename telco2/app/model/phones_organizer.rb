require_relative 'phone_number'

class PhonesOrganizer
  def initialize
    @phones = {}
  end

  def find_or_create_phone(number)
    return @phones[number] if @phones.include?(number)

    @phones[number] = PhoneNumber.new(number)
  end

  def reset
    @phones.clear
  end
end
