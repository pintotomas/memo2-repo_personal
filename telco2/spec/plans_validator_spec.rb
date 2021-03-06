require 'rspec'
require_relative '../app/helpers/plans_validator'
require 'json'
describe 'PlansValidator' do
  validator = PlansValidator.new
  context 'when missing plan argument' do
    it 'raises missing argument error' do
      input = JSON.parse('{ "numero": "54 011 4444 1111", "amigos":"5401133334444,5401133335555,5401133336666" }')
      expect do
        validator.validate_input(input)
      end.to raise_error(MissingArgumentError)
    end
  end

  context 'when missing numero argument' do
    it 'raises missing argument error' do
      input = JSON.parse('{"plan":"amigos", "amigos":"5401133334444,5401133335555,5401133336666" }')
      expect do
        validator.validate_input(input)
      end.to raise_error(MissingArgumentError)
    end
  end

  context 'when registering a plan with an invalid name' do
    it 'raises missing argument error' do
      input = JSON.parse('{ "numero": "54 011 4444 1111", "plan": "nacional", "amigos":"5401133334444,5401133335555,5401133336666" }')
      expect do
        validator.validate_input(input)
      end.to raise_error(WrongArgumentFormat)
    end
  end

  context 'when registering an amigos plan without friends phones' do
    it 'raises missing argument error' do
      input = JSON.parse('{ "numero": "54 011 4444 1111", "plan": "amigos"}')
      expect do
        validator.validate_input(input)
      end.to raise_error(MissingArgumentError)
    end
  end

  context 'when registering a turista plan without international code of the plan' do
    it 'raises missing argument error' do
      input = JSON.parse('{ "numero": "54 011 4444 1111", "plan": "turista" }')
      expect do
        validator.validate_input(input)
      end.to raise_error(MissingArgumentError)
    end
  end

  context 'when registering an amigos plan with invalid friends phone numbers' do
    it 'raises missing argument error' do
      input = JSON.parse('{ "numero": "54 011 4444 1111", "plan": "amigos", "amigos":"54011x3334444,5401133335555,5401133336666" }')
      expect do
        validator.validate_input(input)
      end.to raise_error(WrongArgumentFormat)
    end
  end

  context 'when registering an amigos plan with valid phone numbers and from another country' do
    it 'raises missing argument error' do
      input = JSON.parse('{ "numero": "54 011 4444 1111", "plan": "amigos", "amigos":"5501153334444,5401133335555,5401133336666" }')
      expect do
        validator.validate_input(input)
      end.to raise_error(WrongArgumentFormat)
    end
  end

  context 'when registering a tursita plan with invalid country code number' do
    it 'raises wrong argument error' do
      input = JSON.parse('{ "numero": "54 011 4444 1111", "plan": "turista", "pais":"12" }')
      expect do
        validator.validate_input(input)
      end.to raise_error(WrongArgumentFormat)
    end
  end
end
