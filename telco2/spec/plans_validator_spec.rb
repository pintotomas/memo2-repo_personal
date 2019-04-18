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
end
