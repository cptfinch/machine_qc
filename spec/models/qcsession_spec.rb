require File.dirname(__FILE__) + '/../spec_helper'

describe Qcsession do
  before(:each) do
    @qcsession = Qcsession.new
  end

  it "should be valid" do
    @qcsession.should be_valid
  end
end
