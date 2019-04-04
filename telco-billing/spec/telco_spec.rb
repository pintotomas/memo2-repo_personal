require 'rspec'
require_relative '../app/model/telco'

describe 'Telco' do
  let(:telco) { Telco.new }

  it 'Local call with one minute duration between 8 and 20 hs on weekdays should cost 3.2' do
    expect(telco.call_cost('20190211;14:30', '20190211;14:31')).to eq 3.2
  end

  it 'Local call with one minute duration between 20 and 8 hs on weekdays should cost 1.8' do
    expect(telco.call_cost('20190211;22:30', '20190211;22:31')).to eq 1.8
  end
  it 'Local call with one minute duration on weekend should cost 2.1' do
    expect(telco.call_cost('20190210;14:30', '20190210;14:31')).to eq 2.1
  end
end
