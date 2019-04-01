require 'docking_station'
describe DockingStation do
  describe '#release_bike' do
    it { is_expected.to respond_to :release_bike }

    it 'raises an error when no bike bike' do
      expect { subject.release_bike }.to raise_error('No bikes available!')
    end
  end

  describe '#dock_bike' do
    it { is_expected.to respond_to(:dock_bike).with(1).argument }
  end
end
