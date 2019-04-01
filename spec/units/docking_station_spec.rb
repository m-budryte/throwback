require 'docking_station'
describe DockingStation do
  describe '#release_bike' do
    it { is_expected.to respond_to :release_bike }

    it 'releases working bikes' do
      bike = subject.release_bike
      expect(bike).to be_working
    end
  end

    describe '#dock_bike' do
      it { is_expected.to respond_to(:dock_bike).with(1).argument }

      it 'stores a bike' do
        bike = subject.release_bike
        subject.dock_bike(bike)
        expect(subject.bike).to eq bike
      end


    end
end
