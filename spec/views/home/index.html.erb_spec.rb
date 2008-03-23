require File.dirname(__FILE__) + '/../../spec_helper'

describe "/home/index" do
  before do
    render 'home/index'
  end
  
  it "should show the page title" do
    response.should have_tag('h1', /Home/)
  end
  
end

describe "/home/index when logged out" do
  before do
    render 'home/index'
  end
  
  it "should include link to sign up" do
    response.should have_tag('a', /Sign up/)
  end
    
  it "should include link to log in" do
    response.should have_tag('a', /Log in/)
  end
  
end

describe "/home/index when logged in" do
  before do
    render 'home/index'
  end
  
  it "should include link to logout" 

end