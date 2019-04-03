require 'rspec'
require_relative '../app/model/telco'

describe 'Telco' do
  let(:telco) { Telco.new }

  it 'Local call with one minute duration should cost 3.2' do
    expect(telco.call_cost('20190211;14:30', '20190211;14:31')).to eq 3.2
  end
end
