require 'docking_station'
describe DockingStation do
  let(:bike) { double :bike }
  let(:broken_bike) { double :broken_bike }
  describe '#release_bike' do
    it { is_expected.to respond_to :release_bike }

    it 'raises an error when no bike available' do
      expect { subject.release_bike }.to raise_error('No bikes available!')
    end

    it 'does not release broken bikes' do
      subject.dock_bike(bike)
      allow(bike).to receive(:working?)
      expect{subject.release_bike}.to raise_error('No working bikes available!')
    end
  end

  describe '#dock_bike' do
    it { is_expected.to respond_to(:dock_bike).with(1).argument }

    it 'raises an error when the capacity is reached' do
      DockingStation::DEFAULT_CAPACITY.times { subject.dock_bike bike }
      expect { subject.dock_bike(bike) }.to raise_error('No space available!')
    end
  end

  it 'sets the capacity' do
    docking_station = DockingStation.new(20)
    expect(docking_station.capacity).to eq(20)
  end

  it 'releases broken bikes as an array' do
    subject.dock_bike(broken_bike)
    allow(broken_bike).to receive(:broken?).and_return(true)
    expect(subject.release_broken_bikes).to eq([broken_bike])
  end
end
