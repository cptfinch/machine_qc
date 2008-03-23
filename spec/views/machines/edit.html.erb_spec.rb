require File.dirname(__FILE__) + '/../../spec_helper'

describe "/machines/edit.html.erb" do
  include MachinesHelper
  
  before do
    @machine = mock_model(Machine)
    @machine.stub!(:name).and_return("MyString")
    assigns[:machine] = @machine
  end

  it "should render edit form" do
    render "/machines/edit.html.erb"
    
    response.should have_tag("form[action=#{machine_path(@machine)}][method=post]") do
      with_tag('input#machine_name[name=?]', "machine[name]")
    end
  end
end


