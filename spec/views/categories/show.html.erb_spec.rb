require File.dirname(__FILE__) + '/../../spec_helper'

describe "/categories/show.html.erb" do
  include CategoriesHelper
  
  before do
    @category = mock_model(Category)
    @category.stub!(:name).and_return("MyString")

    assigns[:category] = @category
  end

  it "should render attributes in <p>" do
    render "/categories/show.html.erb"
    response.should have_text(/MyString/)
  end
end

