require File.dirname(__FILE__) + '/../../spec_helper'

describe "/machines/new.html.erb" do
  include MachinesHelper
  
  before do
    @machine = mock_model(Machine)
    @machine.stub!(:new_record?).and_return(true)
    @machine.stub!(:name).and_return("MyString")
    assigns[:machine] = @machine
  end

  it "should render new form" do
    render "/machines/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", machines_path) do
      with_tag("input#machine_name[name=?]", "machine[name]")
    end
  end
end


