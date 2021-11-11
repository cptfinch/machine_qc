require File.dirname(__FILE__) + '/../spec_helper'

describe QcsessionTypesController, "#route_for" do

  it "should map { :controller => 'qcsession_types', :action => 'index' } to /qcsession_types" do
    route_for(:controller => "qcsession_types", :action => "index").should == "/qcsession_types"
  end
  
  it "should map { :controller => 'qcsession_types', :action => 'new' } to /qcsession_types/new" do
    route_for(:controller => "qcsession_types", :action => "new").should == "/qcsession_types/new"
  end
  
  it "should map { :controller => 'qcsession_types', :action => 'show', :id => 1 } to /qcsession_types/1" do
    route_for(:controller => "qcsession_types", :action => "show", :id => 1).should == "/qcsession_types/1"
  end
  
  it "should map { :controller => 'qcsession_types', :action => 'edit', :id => 1 } to /qcsession_types/1/edit" do
    route_for(:controller => "qcsession_types", :action => "edit", :id => 1).should == "/qcsession_types/1/edit"
  end
  
  it "should map { :controller => 'qcsession_types', :action => 'update', :id => 1} to /qcsession_types/1" do
    route_for(:controller => "qcsession_types", :action => "update", :id => 1).should == "/qcsession_types/1"
  end
  
  it "should map { :controller => 'qcsession_types', :action => 'destroy', :id => 1} to /qcsession_types/1" do
    route_for(:controller => "qcsession_types", :action => "destroy", :id => 1).should == "/qcsession_types/1"
  end
  
end

describe QcsessionTypesController, "#params_from" do

  it "should generate params { :controller => 'qcsession_types', action => 'index' } from GET /qcsession_types" do
    params_from(:get, "/qcsession_types").should == {:controller => "qcsession_types", :action => "index"}
  end
  
  it "should generate params { :controller => 'qcsession_types', action => 'new' } from GET /qcsession_types/new" do
    params_from(:get, "/qcsession_types/new").should == {:controller => "qcsession_types", :action => "new"}
  end
  
  it "should generate params { :controller => 'qcsession_types', action => 'create' } from POST /qcsession_types" do
    params_from(:post, "/qcsession_types").should == {:controller => "qcsession_types", :action => "create"}
  end
  
  it "should generate params { :controller => 'qcsession_types', action => 'show', id => '1' } from GET /qcsession_types/1" do
    params_from(:get, "/qcsession_types/1").should == {:controller => "qcsession_types", :action => "show", :id => "1"}
  end
  
  it "should generate params { :controller => 'qcsession_types', action => 'edit', id => '1' } from GET /qcsession_types/1;edit" do
    params_from(:get, "/qcsession_types/1/edit").should == {:controller => "qcsession_types", :action => "edit", :id => "1"}
  end
  
  it "should generate params { :controller => 'qcsession_types', action => 'update', id => '1' } from PUT /qcsession_types/1" do
    params_from(:put, "/qcsession_types/1").should == {:controller => "qcsession_types", :action => "update", :id => "1"}
  end
  
  it "should generate params { :controller => 'qcsession_types', action => 'destroy', id => '1' } from DELETE /qcsession_types/1" do
    params_from(:delete, "/qcsession_types/1").should == {:controller => "qcsession_types", :action => "destroy", :id => "1"}
  end
  
end

describe QcsessionTypesController, "handling GET /qcsession_types" do

  before do
    @qcsession_type = mock_model(QcsessionType)
    QcsessionType.stub!(:find).and_return([@qcsession_type])
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
  
  it "should find all qcsession_types" do
    QcsessionType.should_receive(:find).with(:all).and_return([@qcsession_type])
    do_get
  end
  
  it "should assign the found qcsession_types for the view" do
    do_get
    assigns[:qcsession_types].should == [@qcsession_type]
  end
end

describe QcsessionTypesController, "handling GET /qcsession_types.xml" do

  before do
    @qcsession_type = mock_model(QcsessionType, :to_xml => "XML")
    QcsessionType.stub!(:find).and_return(@qcsession_type)
  end
  
  def do_get
    @request.env["HTTP_ACCEPT"] = "application/xml"
    get :index
  end
  
  it "should be successful" do
    do_get
    response.should be_success
  end

  it "should find all qcsession_types" do
    QcsessionType.should_receive(:find).with(:all).and_return([@qcsession_type])
    do_get
  end
  
  it "should render the found qcsession_types as xml" do
    @qcsession_type.should_receive(:to_xml).and_return("XML")
    do_get
    response.body.should == "XML"
  end
end

describe QcsessionTypesController, "handling GET /qcsession_types/1" do

  before do
    @qcsession_type = mock_model(QcsessionType)
    QcsessionType.stub!(:find).and_return(@qcsession_type)
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
  
  it "should find the qcsession_type requested" do
    QcsessionType.should_receive(:find).with("1").and_return(@qcsession_type)
    do_get
  end
  
  it "should assign the found qcsession_type for the view" do
    do_get
    assigns[:qcsession_type].should equal(@qcsession_type)
  end
end

describe QcsessionTypesController, "handling GET /qcsession_types/1.xml" do

  before do
    @qcsession_type = mock_model(QcsessionType, :to_xml => "XML")
    QcsessionType.stub!(:find).and_return(@qcsession_type)
  end
  
  def do_get
    @request.env["HTTP_ACCEPT"] = "application/xml"
    get :show, :id => "1"
  end

  it "should be successful" do
    do_get
    response.should be_success
  end
  
  it "should find the qcsession_type requested" do
    QcsessionType.should_receive(:find).with("1").and_return(@qcsession_type)
    do_get
  end
  
  it "should render the found qcsession_type as xml" do
    @qcsession_type.should_receive(:to_xml).and_return("XML")
    do_get
    response.body.should == "XML"
  end
end

describe QcsessionTypesController, "handling GET /qcsession_types/new" do

  before do
    @qcsession_type = mock_model(QcsessionType)
    QcsessionType.stub!(:new).and_return(@qcsession_type)
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
  
  it "should create an new qcsession_type" do
    QcsessionType.should_receive(:new).and_return(@qcsession_type)
    do_get
  end
  
  it "should not save the new qcsession_type" do
    @qcsession_type.should_not_receive(:save)
    do_get
  end
  
  it "should assign the new qcsession_type for the view" do
    do_get
    assigns[:qcsession_type].should equal(@qcsession_type)
  end
end

describe QcsessionTypesController, "handling GET /qcsession_types/1/edit" do

  before do
    @qcsession_type = mock_model(QcsessionType)
    QcsessionType.stub!(:find).and_return(@qcsession_type)
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
  
  it "should find the qcsession_type requested" do
    QcsessionType.should_receive(:find).and_return(@qcsession_type)
    do_get
  end
  
  it "should assign the found QcsessionType for the view" do
    do_get
    assigns[:qcsession_type].should equal(@qcsession_type)
  end
end

describe QcsessionTypesController, "handling POST /qcsession_types" do

  before do
    @qcsession_type = mock_model(QcsessionType, :to_param => "1")
    QcsessionType.stub!(:new).and_return(@qcsession_type)
  end
  
  def post_with_successful_save
    @qcsession_type.should_receive(:save).and_return(true)
    post :create, :qcsession_type => {}
  end
  
  def post_with_failed_save
    @qcsession_type.should_receive(:save).and_return(false)
    post :create, :qcsession_type => {}
  end
  
  it "should create a new qcsession_type" do
    QcsessionType.should_receive(:new).with({}).and_return(@qcsession_type)
    post_with_successful_save
  end

  it "should redirect to the new qcsession_type on successful save" do
    post_with_successful_save
    response.should redirect_to(qcsession_type_url("1"))
  end

  it "should re-render 'new' on failed save" do
    post_with_failed_save
    response.should render_template('new')
  end
end

describe QcsessionTypesController, "handling PUT /qcsession_types/1" do

  before do
    @qcsession_type = mock_model(QcsessionType, :to_param => "1")
    QcsessionType.stub!(:find).and_return(@qcsession_type)
  end
  
  def put_with_successful_update
    @qcsession_type.should_receive(:update_attributes).and_return(true)
    put :update, :id => "1"
  end
  
  def put_with_failed_update
    @qcsession_type.should_receive(:update_attributes).and_return(false)
    put :update, :id => "1"
  end
  
  it "should find the qcsession_type requested" do
    QcsessionType.should_receive(:find).with("1").and_return(@qcsession_type)
    put_with_successful_update
  end

  it "should update the found qcsession_type" do
    put_with_successful_update
    assigns(:qcsession_type).should equal(@qcsession_type)
  end

  it "should assign the found qcsession_type for the view" do
    put_with_successful_update
    assigns(:qcsession_type).should equal(@qcsession_type)
  end

  it "should redirect to the qcsession_type on successful update" do
    put_with_successful_update
    response.should redirect_to(qcsession_type_url("1"))
  end

  it "should re-render 'edit' on failed update" do
    put_with_failed_update
    response.should render_template('edit')
  end
end

describe QcsessionTypesController, "handling DELETE /qcsession_types/1" do

  before do
    @qcsession_type = mock_model(QcsessionType, :destroy => true)
    QcsessionType.stub!(:find).and_return(@qcsession_type)
  end
  
  def do_delete
    delete :destroy, :id => "1"
  end

  it "should find the qcsession_type requested" do
    QcsessionType.should_receive(:find).with("1").and_return(@qcsession_type)
    do_delete
  end
  
  it "should call destroy on the found qcsession_type" do
    @qcsession_type.should_receive(:destroy)
    do_delete
  end
  
  it "should redirect to the qcsession_types list" do
    do_delete
    response.should redirect_to(qcsession_types_url)
  end
end
