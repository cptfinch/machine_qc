require File.dirname(__FILE__) + '/../../spec_helper'

describe "/measurements/index.html.erb" do
  include MeasurementsHelper
  
  before do
    measurement_98 = mock_model(Measurement)
    measurement_98.should_receive(:measurement_type_id).and_return("1")
    measurement_98.should_receive(:qcsession_id).and_return("1")
    measurement_98.should_receive(:value).and_return("1")
    measurement_98.should_receive(:machine_id).and_return("1")
    measurement_99 = mock_model(Measurement)
    measurement_99.should_receive(:measurement_type_id).and_return("1")
    measurement_99.should_receive(:qcsession_id).and_return("1")
    measurement_99.should_receive(:value).and_return("1")
    measurement_99.should_receive(:machine_id).and_return("1")

    assigns[:measurements] = [measurement_98, measurement_99]
  end

  it "should render list of measurements" do
    render "/measurements/index.html.erb"
    response.should have_tag("tr>td", "1", 2)
  end
end

