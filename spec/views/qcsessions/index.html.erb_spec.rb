require File.dirname(__FILE__) + '/../../spec_helper'

describe "/qcsessions/index.html.erb" do
  include QcsessionsHelper
  
  before do
    qcsession_98 = mock_model(Qcsession)
    qcsession_98.should_receive(:machine_id).and_return("1")
    qcsession_99 = mock_model(Qcsession)
    qcsession_99.should_receive(:machine_id).and_return("1")

    assigns[:qcsessions] = [qcsession_98, qcsession_99]
  end

  it "should render list of qcsessions" do
    render "/qcsessions/index.html.erb"
  end
end

