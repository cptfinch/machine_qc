require File.dirname(__FILE__) + '/../../spec_helper'

describe "/qcsessions/show.html.erb" do
  include QcsessionsHelper
  
  before do
    @qcsession = mock_model(Qcsession)
    @qcsession.stub!(:machine_id).and_return("1")

    assigns[:qcsession] = @qcsession
  end

  it "should render attributes in <p>" do
    render "/qcsessions/show.html.erb"
  end
end

