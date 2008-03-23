require File.dirname(__FILE__) + '/../../spec_helper'

describe "/qcsessions/new.html.erb" do
  include QcsessionsHelper
  
  before do
    @qcsession = mock_model(Qcsession)
    @qcsession.stub!(:new_record?).and_return(true)
    @qcsession.stub!(:machine_id).and_return("1")
    assigns[:qcsession] = @qcsession
  end

  it "should render new form" do
    render "/qcsessions/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", qcsessions_path) do
    end
  end
end


