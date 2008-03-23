require File.dirname(__FILE__) + '/../spec_helper'

describe Measurement do
  before(:each) do
    @measurement = Measurement.new
  end

  it "should be valid" do
    @measurement.should be_valid
  end
end
