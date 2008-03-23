require File.dirname(__FILE__) + '/../spec_helper'

describe CategoriesController, "#route_for" do

  it "should map { :controller => 'categories', :action => 'index' } to /categories" do
    route_for(:controller => "categories", :action => "index").should == "/categories"
  end
  
  it "should map { :controller => 'categories', :action => 'new' } to /categories/new" do
    route_for(:controller => "categories", :action => "new").should == "/categories/new"
  end
  
  it "should map { :controller => 'categories', :action => 'show', :id => 1 } to /categories/1" do
    route_for(:controller => "categories", :action => "show", :id => 1).should == "/categories/1"
  end
  
  it "should map { :controller => 'categories', :action => 'edit', :id => 1 } to /categories/1/edit" do
    route_for(:controller => "categories", :action => "edit", :id => 1).should == "/categories/1/edit"
  end
  
  it "should map { :controller => 'categories', :action => 'update', :id => 1} to /categories/1" do
    route_for(:controller => "categories", :action => "update", :id => 1).should == "/categories/1"
  end
  
  it "should map { :controller => 'categories', :action => 'destroy', :id => 1} to /categories/1" do
    route_for(:controller => "categories", :action => "destroy", :id => 1).should == "/categories/1"
  end
  
end

describe CategoriesController, "#params_from" do

  it "should generate params { :controller => 'categories', action => 'index' } from GET /categories" do
    params_from(:get, "/categories").should == {:controller => "categories", :action => "index"}
  end
  
  it "should generate params { :controller => 'categories', action => 'new' } from GET /categories/new" do
    params_from(:get, "/categories/new").should == {:controller => "categories", :action => "new"}
  end
  
  it "should generate params { :controller => 'categories', action => 'create' } from POST /categories" do
    params_from(:post, "/categories").should == {:controller => "categories", :action => "create"}
  end
  
  it "should generate params { :controller => 'categories', action => 'show', id => '1' } from GET /categories/1" do
    params_from(:get, "/categories/1").should == {:controller => "categories", :action => "show", :id => "1"}
  end
  
  it "should generate params { :controller => 'categories', action => 'edit', id => '1' } from GET /categories/1;edit" do
    params_from(:get, "/categories/1/edit").should == {:controller => "categories", :action => "edit", :id => "1"}
  end
  
  it "should generate params { :controller => 'categories', action => 'update', id => '1' } from PUT /categories/1" do
    params_from(:put, "/categories/1").should == {:controller => "categories", :action => "update", :id => "1"}
  end
  
  it "should generate params { :controller => 'categories', action => 'destroy', id => '1' } from DELETE /categories/1" do
    params_from(:delete, "/categories/1").should == {:controller => "categories", :action => "destroy", :id => "1"}
  end
  
end

describe CategoriesController, "handling GET /categories" do

  before do
    @category = mock_model(Category)
    Category.stub!(:find).and_return([@category])
  end
  
  def do_get
    get :index
  end
  
  it "should be successful" do
    do_get
    response.should be_success
  end

  it "should render index template" do
    do_get
    response.should render_template('index')
  end
  
  it "should find all categories" do
    Category.should_receive(:find).with(:all).and_return([@category])
    do_get
  end
  
  it "should assign the found categories for the view" do
    do_get
    assigns[:categories].should == [@category]
  end
end

describe CategoriesController, "handling GET /categories.xml" do

  before do
    @category = mock_model(Category, :to_xml => "XML")
    Category.stub!(:find).and_return(@category)
  end
  
  def do_get
    @request.env["HTTP_ACCEPT"] = "application/xml"
    get :index
  end
  
  it "should be successful" do
    do_get
    response.should be_success
  end

  it "should find all categories" do
    Category.should_receive(:find).with(:all).and_return([@category])
    do_get
  end
  
  it "should render the found categories as xml" do
    @category.should_receive(:to_xml).and_return("XML")
    do_get
    response.body.should == "XML"
  end
end

describe CategoriesController, "handling GET /categories/1" do

  before do
    @category = mock_model(Category)
    Category.stub!(:find).and_return(@category)
  end
  
  def do_get
    get :show, :id => "1"
  end

  it "should be successful" do
    do_get
    response.should be_success
  end
  
  it "should render show template" do
    do_get
    response.should render_template('show')
  end
  
  it "should find the category requested" do
    Category.should_receive(:find).with("1").and_return(@category)
    do_get
  end
  
  it "should assign the found category for the view" do
    do_get
    assigns[:category].should equal(@category)
  end
end

describe CategoriesController, "handling GET /categories/1.xml" do

  before do
    @category = mock_model(Category, :to_xml => "XML")
    Category.stub!(:find).and_return(@category)
  end
  
  def do_get
    @request.env["HTTP_ACCEPT"] = "application/xml"
    get :show, :id => "1"
  end

  it "should be successful" do
    do_get
    response.should be_success
  end
  
  it "should find the category requested" do
    Category.should_receive(:find).with("1").and_return(@category)
    do_get
  end
  
  it "should render the found category as xml" do
    @category.should_receive(:to_xml).and_return("XML")
    do_get
    response.body.should == "XML"
  end
end

describe CategoriesController, "handling GET /categories/new" do

  before do
    @category = mock_model(Category)
    Category.stub!(:new).and_return(@category)
  end
  
  def do_get
    get :new
  end

  it "should be successful" do
    do_get
    response.should be_success
  end
  
  it "should render new template" do
    do_get
    response.should render_template('new')
  end
  
  it "should create an new category" do
    Category.should_receive(:new).and_return(@category)
    do_get
  end
  
  it "should not save the new category" do
    @category.should_not_receive(:save)
    do_get
  end
  
  it "should assign the new category for the view" do
    do_get
    assigns[:category].should equal(@category)
  end
end

describe CategoriesController, "handling GET /categories/1/edit" do

  before do
    @category = mock_model(Category)
    Category.stub!(:find).and_return(@category)
  end
  
  def do_get
    get :edit, :id => "1"
  end

  it "should be successful" do
    do_get
    response.should be_success
  end
  
  it "should render edit template" do
    do_get
    response.should render_template('edit')
  end
  
  it "should find the category requested" do
    Category.should_receive(:find).and_return(@category)
    do_get
  end
  
  it "should assign the found Category for the view" do
    do_get
    assigns[:category].should equal(@category)
  end
end

describe CategoriesController, "handling POST /categories" do

  before do
    @category = mock_model(Category, :to_param => "1")
    Category.stub!(:new).and_return(@category)
  end
  
  def post_with_successful_save
    @category.should_receive(:save).and_return(true)
    post :create, :category => {}
  end
  
  def post_with_failed_save
    @category.should_receive(:save).and_return(false)
    post :create, :category => {}
  end
  
  it "should create a new category" do
    Category.should_receive(:new).with({}).and_return(@category)
    post_with_successful_save
  end

  it "should redirect to the new category on successful save" do
    post_with_successful_save
    response.should redirect_to(category_url("1"))
  end

  it "should re-render 'new' on failed save" do
    post_with_failed_save
    response.should render_template('new')
  end
end

describe CategoriesController, "handling PUT /categories/1" do

  before do
    @category = mock_model(Category, :to_param => "1")
    Category.stub!(:find).and_return(@category)
  end
  
  def put_with_successful_update
    @category.should_receive(:update_attributes).and_return(true)
    put :update, :id => "1"
  end
  
  def put_with_failed_update
    @category.should_receive(:update_attributes).and_return(false)
    put :update, :id => "1"
  end
  
  it "should find the category requested" do
    Category.should_receive(:find).with("1").and_return(@category)
    put_with_successful_update
  end

  it "should update the found category" do
    put_with_successful_update
    assigns(:category).should equal(@category)
  end

  it "should assign the found category for the view" do
    put_with_successful_update
    assigns(:category).should equal(@category)
  end

  it "should redirect to the category on successful update" do
    put_with_successful_update
    response.should redirect_to(category_url("1"))
  end

  it "should re-render 'edit' on failed update" do
    put_with_failed_update
    response.should render_template('edit')
  end
end

describe CategoriesController, "handling DELETE /categories/1" do

  before do
    @category = mock_model(Category, :destroy => true)
    Category.stub!(:find).and_return(@category)
  end
  
  def do_delete
    delete :destroy, :id => "1"
  end

  it "should find the category requested" do
    Category.should_receive(:find).with("1").and_return(@category)
    do_delete
  end
  
  it "should call destroy on the found category" do
    @category.should_receive(:destroy)
    do_delete
  end
  
  it "should redirect to the categories list" do
    do_delete
    response.should redirect_to(categories_url)
  end
end
