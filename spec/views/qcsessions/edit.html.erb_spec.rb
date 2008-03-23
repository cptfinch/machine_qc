require File.dirname(__FILE__) + '/../../spec_helper'

describe "/qcsessions/edit.html.erb" do
  include QcsessionsHelper
  
  before do
    @qcsession = mock_model(Qcsession)
    @qcsession.stub!(:machine_id).and_return("1")
    assigns[:qcsession] = @qcsession
  end

  it "should render edit form" do
    render "/qcsessions/edit.html.erb"
    
    response.should have_tag("form[action=#{qcsession_path(@qcsession)}][method=post]") do
    end
  end
end


