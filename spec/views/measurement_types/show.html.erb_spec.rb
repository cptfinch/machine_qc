require File.dirname(__FILE__) + '/../../spec_helper'

describe "/measurement_types/show.html.erb" do
  include MeasurementTypesHelper
  
  before do
    @measurement_type = mock_model(MeasurementType)
    @measurement_type.stub!(:category_id).and_return("1")
    @measurement_type.stub!(:name).and_return("MyString")
    @measurement_type.stub!(:description).and_return("MyText")

    assigns[:measurement_type] = @measurement_type
  end

  it "should render attributes in <p>" do
    render "/measurement_types/show.html.erb"
    response.should have_text(/MyString/)
    response.should have_text(/MyText/)
  end
end

