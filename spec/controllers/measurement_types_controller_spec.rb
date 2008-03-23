require File.dirname(__FILE__) + '/../spec_helper'

describe MeasurementTypesController, "#route_for" do

  it "should map { :controller => 'measurement_types', :action => 'index' } to /measurement_types" do
    route_for(:controller => "measurement_types", :action => "index").should == "/measurement_types"
  end
  
  it "should map { :controller => 'measurement_types', :action => 'new' } to /measurement_types/new" do
    route_for(:controller => "measurement_types", :action => "new").should == "/measurement_types/new"
  end
  
  it "should map { :controller => 'measurement_types', :action => 'show', :id => 1 } to /measurement_types/1" do
    route_for(:controller => "measurement_types", :action => "show", :id => 1).should == "/measurement_types/1"
  end
  
  it "should map { :controller => 'measurement_types', :action => 'edit', :id => 1 } to /measurement_types/1/edit" do
    route_for(:controller => "measurement_types", :action => "edit", :id => 1).should == "/measurement_types/1/edit"
  end
  
  it "should map { :controller => 'measurement_types', :action => 'update', :id => 1} to /measurement_types/1" do
    route_for(:controller => "measurement_types", :action => "update", :id => 1).should == "/measurement_types/1"
  end
  
  it "should map { :controller => 'measurement_types', :action => 'destroy', :id => 1} to /measurement_types/1" do
    route_for(:controller => "measurement_types", :action => "destroy", :id => 1).should == "/measurement_types/1"
  end
  
end

describe MeasurementTypesController, "#params_from" do

  it "should generate params { :controller => 'measurement_types', action => 'index' } from GET /measurement_types" do
    params_from(:get, "/measurement_types").should == {:controller => "measurement_types", :action => "index"}
  end
  
  it "should generate params { :controller => 'measurement_types', action => 'new' } from GET /measurement_types/new" do
    params_from(:get, "/measurement_types/new").should == {:controller => "measurement_types", :action => "new"}
  end
  
  it "should generate params { :controller => 'measurement_types', action => 'create' } from POST /measurement_types" do
    params_from(:post, "/measurement_types").should == {:controller => "measurement_types", :action => "create"}
  end
  
  it "should generate params { :controller => 'measurement_types', action => 'show', id => '1' } from GET /measurement_types/1" do
    params_from(:get, "/measurement_types/1").should == {:controller => "measurement_types", :action => "show", :id => "1"}
  end
  
  it "should generate params { :controller => 'measurement_types', action => 'edit', id => '1' } from GET /measurement_types/1;edit" do
    params_from(:get, "/measurement_types/1/edit").should == {:controller => "measurement_types", :action => "edit", :id => "1"}
  end
  
  it "should generate params { :controller => 'measurement_types', action => 'update', id => '1' } from PUT /measurement_types/1" do
    params_from(:put, "/measurement_types/1").should == {:controller => "measurement_types", :action => "update", :id => "1"}
  end
  
  it "should generate params { :controller => 'measurement_types', action => 'destroy', id => '1' } from DELETE /measurement_types/1" do
    params_from(:delete, "/measurement_types/1").should == {:controller => "measurement_types", :action => "destroy", :id => "1"}
  end
  
end

describe MeasurementTypesController, "handling GET /measurement_types" do

  before do
    @measurement_type = mock_model(MeasurementType)
    MeasurementType.stub!(:find).and_return([@measurement_type])
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
  
  it "should find all measurement_types" do
    MeasurementType.should_receive(:find).with(:all).and_return([@measurement_type])
    do_get
  end
  
  it "should assign the found measurement_types for the view" do
    do_get
    assigns[:measurement_types].should == [@measurement_type]
  end
end

describe MeasurementTypesController, "handling GET /measurement_types.xml" do

  before do
    @measurement_type = mock_model(MeasurementType, :to_xml => "XML")
    MeasurementType.stub!(:find).and_return(@measurement_type)
  end
  
  def do_get
    @request.env["HTTP_ACCEPT"] = "application/xml"
    get :index
  end
  
  it "should be successful" do
    do_get
    response.should be_success
  end

  it "should find all measurement_types" do
    MeasurementType.should_receive(:find).with(:all).and_return([@measurement_type])
    do_get
  end
  
  it "should render the found measurement_types as xml" do
    @measurement_type.should_receive(:to_xml).and_return("XML")
    do_get
    response.body.should == "XML"
  end
end

describe MeasurementTypesController, "handling GET /measurement_types/1" do

  before do
    @measurement_type = mock_model(MeasurementType)
    MeasurementType.stub!(:find).and_return(@measurement_type)
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
  
  it "should find the measurement_type requested" do
    MeasurementType.should_receive(:find).with("1").and_return(@measurement_type)
    do_get
  end
  
  it "should assign the found measurement_type for the view" do
    do_get
    assigns[:measurement_type].should equal(@measurement_type)
  end
end

describe MeasurementTypesController, "handling GET /measurement_types/1.xml" do

  before do
    @measurement_type = mock_model(MeasurementType, :to_xml => "XML")
    MeasurementType.stub!(:find).and_return(@measurement_type)
  end
  
  def do_get
    @request.env["HTTP_ACCEPT"] = "application/xml"
    get :show, :id => "1"
  end

  it "should be successful" do
    do_get
    response.should be_success
  end
  
  it "should find the measurement_type requested" do
    MeasurementType.should_receive(:find).with("1").and_return(@measurement_type)
    do_get
  end
  
  it "should render the found measurement_type as xml" do
    @measurement_type.should_receive(:to_xml).and_return("XML")
    do_get
    response.body.should == "XML"
  end
end

describe MeasurementTypesController, "handling GET /measurement_types/new" do

  before do
    @measurement_type = mock_model(MeasurementType)
    MeasurementType.stub!(:new).and_return(@measurement_type)
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
  
  it "should create an new measurement_type" do
    MeasurementType.should_receive(:new).and_return(@measurement_type)
    do_get
  end
  
  it "should not save the new measurement_type" do
    @measurement_type.should_not_receive(:save)
    do_get
  end
  
  it "should assign the new measurement_type for the view" do
    do_get
    assigns[:measurement_type].should equal(@measurement_type)
  end
end

describe MeasurementTypesController, "handling GET /measurement_types/1/edit" do

  before do
    @measurement_type = mock_model(MeasurementType)
    MeasurementType.stub!(:find).and_return(@measurement_type)
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
  
  it "should find the measurement_type requested" do
    MeasurementType.should_receive(:find).and_return(@measurement_type)
    do_get
  end
  
  it "should assign the found MeasurementType for the view" do
    do_get
    assigns[:measurement_type].should equal(@measurement_type)
  end
end

describe MeasurementTypesController, "handling POST /measurement_types" do

  before do
    @measurement_type = mock_model(MeasurementType, :to_param => "1")
    MeasurementType.stub!(:new).and_return(@measurement_type)
  end
  
  def post_with_successful_save
    @measurement_type.should_receive(:save).and_return(true)
    post :create, :measurement_type => {}
  end
  
  def post_with_failed_save
    @measurement_type.should_receive(:save).and_return(false)
    post :create, :measurement_type => {}
  end
  
  it "should create a new measurement_type" do
    MeasurementType.should_receive(:new).with({}).and_return(@measurement_type)
    post_with_successful_save
  end

  it "should redirect to the new measurement_type on successful save" do
    post_with_successful_save
    response.should redirect_to(measurement_type_url("1"))
  end

  it "should re-render 'new' on failed save" do
    post_with_failed_save
    response.should render_template('new')
  end
end

describe MeasurementTypesController, "handling PUT /measurement_types/1" do

  before do
    @measurement_type = mock_model(MeasurementType, :to_param => "1")
    MeasurementType.stub!(:find).and_return(@measurement_type)
  end
  
  def put_with_successful_update
    @measurement_type.should_receive(:update_attributes).and_return(true)
    put :update, :id => "1"
  end
  
  def put_with_failed_update
    @measurement_type.should_receive(:update_attributes).and_return(false)
    put :update, :id => "1"
  end
  
  it "should find the measurement_type requested" do
    MeasurementType.should_receive(:find).with("1").and_return(@measurement_type)
    put_with_successful_update
  end

  it "should update the found measurement_type" do
    put_with_successful_update
    assigns(:measurement_type).should equal(@measurement_type)
  end

  it "should assign the found measurement_type for the view" do
    put_with_successful_update
    assigns(:measurement_type).should equal(@measurement_type)
  end

  it "should redirect to the measurement_type on successful update" do
    put_with_successful_update
    response.should redirect_to(measurement_type_url("1"))
  end

  it "should re-render 'edit' on failed update" do
    put_with_failed_update
    response.should render_template('edit')
  end
end

describe MeasurementTypesController, "handling DELETE /measurement_types/1" do

  before do
    @measurement_type = mock_model(MeasurementType, :destroy => true)
    MeasurementType.stub!(:find).and_return(@measurement_type)
  end
  
  def do_delete
    delete :destroy, :id => "1"
  end

  it "should find the measurement_type requested" do
    MeasurementType.should_receive(:find).with("1").and_return(@measurement_type)
    do_delete
  end
  
  it "should call destroy on the found measurement_type" do
    @measurement_type.should_receive(:destroy)
    do_delete
  end
  
  it "should redirect to the measurement_types list" do
    do_delete
    response.should redirect_to(measurement_types_url)
  end
end
