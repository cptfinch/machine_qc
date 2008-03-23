require File.dirname(__FILE__) + '/../../spec_helper'

describe "/measurement_types/index.html.erb" do
  include MeasurementTypesHelper
  
  before do
    measurement_type_98 = mock_model(MeasurementType)
    measurement_type_98.should_receive(:category_id).and_return("1")
    measurement_type_98.should_receive(:name).and_return("MyString")
    measurement_type_98.should_receive(:description).and_return("MyText")
    measurement_type_99 = mock_model(MeasurementType)
    measurement_type_99.should_receive(:category_id).and_return("1")
    measurement_type_99.should_receive(:name).and_return("MyString")
    measurement_type_99.should_receive(:description).and_return("MyText")

    assigns[:measurement_types] = [measurement_type_98, measurement_type_99]
  end

  it "should render list of measurement_types" do
    render "/measurement_types/index.html.erb"
    response.should have_tag("tr>td", "MyString", 2)
    response.should have_tag("tr>td", "MyText", 2)
  end
end

