require 'docking_station'
describe DockingStation do
  describe '#release_bike' do
    it { is_expected.to respond_to :release_bike }

    it 'raises an error when no bike available' do
      expect { subject.release_bike }.to raise_error('No bikes available!')
    end
  end

  describe '#dock_bike' do
    it { is_expected.to respond_to(:dock_bike).with(1).argument }

    it 'raises an error when 20 bikes are docked already' do
      20.times { subject.dock_bike Bike.new }
      expect { subject.dock_bike(Bike.new) }.to raise_error('No space available!')
    end
  end
end
