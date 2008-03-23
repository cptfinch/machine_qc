require File.dirname(__FILE__) + '/../../spec_helper'

describe "/measurements/new.html.erb" do
  include MeasurementsHelper
  
  before do
    @measurement = mock_model(Measurement)
    @measurement.stub!(:new_record?).and_return(true)
    @measurement.stub!(:measurement_type_id).and_return("1")
    @measurement.stub!(:qcsession_id).and_return("1")
    @measurement.stub!(:value).and_return("1")
    @measurement.stub!(:machine_id).and_return("1")
    assigns[:measurement] = @measurement
  end

  it "should render new form" do
    render "/measurements/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", measurements_path) do
      with_tag("input#measurement_value[name=?]", "measurement[value]")
    end
  end
end


