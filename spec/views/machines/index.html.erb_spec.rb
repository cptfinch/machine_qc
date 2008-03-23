require File.dirname(__FILE__) + '/../../spec_helper'

describe "/machines/index.html.erb" do
  include MachinesHelper
  
  before do
    machine_98 = mock_model(Machine)
    machine_98.should_receive(:name).and_return("MyString")
    machine_99 = mock_model(Machine)
    machine_99.should_receive(:name).and_return("MyString")

    assigns[:machines] = [machine_98, machine_99]
  end

  it "should render list of machines" do
    render "/machines/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
  end
end

