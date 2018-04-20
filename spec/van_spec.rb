require 'van'

describe Van, :van_spec do
  it { is_expected.to respond_to(:collect_broken_bikes).with(1).argument }

  it { is_expected.to respond_to(:bikes) }
end
