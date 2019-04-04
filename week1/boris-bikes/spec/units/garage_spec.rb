require 'garage'
describe Garage do
  let(:bikes) { double :bikes }

  it 'collects broken bikes' do
    expect(subject.collect_broken_bikes([bikes])).to eq([bikes])
  end

  it 'releases broken bikes' do
    subject.collect_broken_bikes([bikes])
    expect(subject.release_broken_bikes).to eq([bikes])
  end

  it 'collects working bikes' do
    expect(subject.collect_working_bikes([bikes])).to eq([bikes])
  end

  it 'releases working bikes' do
    subject.collect_working_bikes([bikes])
    expect(subject.release_working_bikes).to eq([bikes])
  end
end
