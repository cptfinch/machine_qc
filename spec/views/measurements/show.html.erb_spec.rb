require File.dirname(__FILE__) + '/../../spec_helper'

describe "/measurements/show.html.erb" do
  include MeasurementsHelper
  
  before do
    @measurement = mock_model(Measurement)
    @measurement.stub!(:measurement_type_id).and_return("1")
    @measurement.stub!(:qcsession_id).and_return("1")
    @measurement.stub!(:value).and_return("1")
    @measurement.stub!(:machine_id).and_return("1")

    assigns[:measurement] = @measurement
  end

  it "should render attributes in <p>" do
    render "/measurements/show.html.erb"
    response.should have_text(/1/)
  end
end

