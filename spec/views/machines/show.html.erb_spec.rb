require File.dirname(__FILE__) + '/../../spec_helper'

describe "/machines/show.html.erb" do
  include MachinesHelper
  
  before do
    @machine = mock_model(Machine)
    @machine.stub!(:name).and_return("MyString")

    assigns[:machine] = @machine
  end

  it "should render attributes in <p>" do
    render "/machines/show.html.erb"
    response.should have_text(/MyString/)
  end
end

