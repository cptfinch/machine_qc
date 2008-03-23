require File.dirname(__FILE__) + '/../spec_helper'

describe MeasurementType do
  before(:each) do
    @measurement_type = MeasurementType.new
  end

  it "should be valid" do
    @measurement_type.should be_valid
  end
end
