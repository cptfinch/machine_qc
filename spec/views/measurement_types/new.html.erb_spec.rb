require File.dirname(__FILE__) + '/../../spec_helper'

describe "/measurement_types/new.html.erb" do
  include MeasurementTypesHelper
  
  before do
    @measurement_type = mock_model(MeasurementType)
    @measurement_type.stub!(:new_record?).and_return(true)
    @measurement_type.stub!(:category_id).and_return("1")
    @measurement_type.stub!(:name).and_return("MyString")
    @measurement_type.stub!(:description).and_return("MyText")
    assigns[:measurement_type] = @measurement_type
  end

  it "should render new form" do
    render "/measurement_types/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", measurement_types_path) do
      with_tag("input#measurement_type_name[name=?]", "measurement_type[name]")
      with_tag("textarea#measurement_type_description[name=?]", "measurement_type[description]")
    end
  end
end


