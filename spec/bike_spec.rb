require 'bike'

describe Bike do
  it { is_expected.to respond_to :working? }

  it { is_expected.to respond_to :report_broken}

  describe "#report_broken" do
    it "reports broken bike" do
      subject.report_broken
      expect(subject).not_to be_working
    end
  end
end
