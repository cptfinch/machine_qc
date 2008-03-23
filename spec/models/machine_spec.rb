require File.dirname(__FILE__) + '/../spec_helper'

describe Machine do
  before(:each) do
    @machine = Machine.new
  end

  it "should be valid" do
    @machine.should be_valid
  end
end
