require 'bike'

describe Bike do
  describe '#working?' do
    it 'returns working for new bikes' do
      expect(subject).to be_working
    end
  end

  describe "#report_broken" do
    it "reports broken bike" do
      subject.report_broken
      expect(subject).not_to be_working
    end
  end
end
