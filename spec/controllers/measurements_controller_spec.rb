require File.dirname(__FILE__) + '/../spec_helper'

describe MeasurementsController, "#route_for" do

  it "should map { :controller => 'measurements', :action => 'index' } to /measurements" do
    route_for(:controller => "measurements", :action => "index").should == "/measurements"
  end
  
  it "should map { :controller => 'measurements', :action => 'new' } to /measurements/new" do
    route_for(:controller => "measurements", :action => "new").should == "/measurements/new"
  end
  
  it "should map { :controller => 'measurements', :action => 'show', :id => 1 } to /measurements/1" do
    route_for(:controller => "measurements", :action => "show", :id => 1).should == "/measurements/1"
  end
  
  it "should map { :controller => 'measurements', :action => 'edit', :id => 1 } to /measurements/1/edit" do
    route_for(:controller => "measurements", :action => "edit", :id => 1).should == "/measurements/1/edit"
  end
  
  it "should map { :controller => 'measurements', :action => 'update', :id => 1} to /measurements/1" do
    route_for(:controller => "measurements", :action => "update", :id => 1).should == "/measurements/1"
  end
  
  it "should map { :controller => 'measurements', :action => 'destroy', :id => 1} to /measurements/1" do
    route_for(:controller => "measurements", :action => "destroy", :id => 1).should == "/measurements/1"
  end
  
end

describe MeasurementsController, "#params_from" do

  it "should generate params { :controller => 'measurements', action => 'index' } from GET /measurements" do
    params_from(:get, "/measurements").should == {:controller => "measurements", :action => "index"}
  end
  
  it "should generate params { :controller => 'measurements', action => 'new' } from GET /measurements/new" do
    params_from(:get, "/measurements/new").should == {:controller => "measurements", :action => "new"}
  end
  
  it "should generate params { :controller => 'measurements', action => 'create' } from POST /measurements" do
    params_from(:post, "/measurements").should == {:controller => "measurements", :action => "create"}
  end
  
  it "should generate params { :controller => 'measurements', action => 'show', id => '1' } from GET /measurements/1" do
    params_from(:get, "/measurements/1").should == {:controller => "measurements", :action => "show", :id => "1"}
  end
  
  it "should generate params { :controller => 'measurements', action => 'edit', id => '1' } from GET /measurements/1;edit" do
    params_from(:get, "/measurements/1/edit").should == {:controller => "measurements", :action => "edit", :id => "1"}
  end
  
  it "should generate params { :controller => 'measurements', action => 'update', id => '1' } from PUT /measurements/1" do
    params_from(:put, "/measurements/1").should == {:controller => "measurements", :action => "update", :id => "1"}
  end
  
  it "should generate params { :controller => 'measurements', action => 'destroy', id => '1' } from DELETE /measurements/1" do
    params_from(:delete, "/measurements/1").should == {:controller => "measurements", :action => "destroy", :id => "1"}
  end
  
end

describe MeasurementsController, "handling GET /measurements" do

  before do
    @measurement = mock_model(Measurement)
    Measurement.stub!(:find).and_return([@measurement])
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
  
  it "should find all measurements" do
    Measurement.should_receive(:find).with(:all).and_return([@measurement])
    do_get
  end
  
  it "should assign the found measurements for the view" do
    do_get
    assigns[:measurements].should == [@measurement]
  end
end

describe MeasurementsController, "handling GET /measurements.xml" do

  before do
    @measurement = mock_model(Measurement, :to_xml => "XML")
    Measurement.stub!(:find).and_return(@measurement)
  end
  
  def do_get
    @request.env["HTTP_ACCEPT"] = "application/xml"
    get :index
  end
  
  it "should be successful" do
    do_get
    response.should be_success
  end

  it "should find all measurements" do
    Measurement.should_receive(:find).with(:all).and_return([@measurement])
    do_get
  end
  
  it "should render the found measurements as xml" do
    @measurement.should_receive(:to_xml).and_return("XML")
    do_get
    response.body.should == "XML"
  end
end

describe MeasurementsController, "handling GET /measurements/1" do

  before do
    @measurement = mock_model(Measurement)
    Measurement.stub!(:find).and_return(@measurement)
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
  
  it "should find the measurement requested" do
    Measurement.should_receive(:find).with("1").and_return(@measurement)
    do_get
  end
  
  it "should assign the found measurement for the view" do
    do_get
    assigns[:measurement].should equal(@measurement)
  end
end

describe MeasurementsController, "handling GET /measurements/1.xml" do

  before do
    @measurement = mock_model(Measurement, :to_xml => "XML")
    Measurement.stub!(:find).and_return(@measurement)
  end
  
  def do_get
    @request.env["HTTP_ACCEPT"] = "application/xml"
    get :show, :id => "1"
  end

  it "should be successful" do
    do_get
    response.should be_success
  end
  
  it "should find the measurement requested" do
    Measurement.should_receive(:find).with("1").and_return(@measurement)
    do_get
  end
  
  it "should render the found measurement as xml" do
    @measurement.should_receive(:to_xml).and_return("XML")
    do_get
    response.body.should == "XML"
  end
end

describe MeasurementsController, "handling GET /measurements/new" do

  before do
    @measurement = mock_model(Measurement)
    Measurement.stub!(:new).and_return(@measurement)
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
  
  it "should create an new measurement" do
    Measurement.should_receive(:new).and_return(@measurement)
    do_get
  end
  
  it "should not save the new measurement" do
    @measurement.should_not_receive(:save)
    do_get
  end
  
  it "should assign the new measurement for the view" do
    do_get
    assigns[:measurement].should equal(@measurement)
  end
end

describe MeasurementsController, "handling GET /measurements/1/edit" do

  before do
    @measurement = mock_model(Measurement)
    Measurement.stub!(:find).and_return(@measurement)
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
  
  it "should find the measurement requested" do
    Measurement.should_receive(:find).and_return(@measurement)
    do_get
  end
  
  it "should assign the found Measurement for the view" do
    do_get
    assigns[:measurement].should equal(@measurement)
  end
end

describe MeasurementsController, "handling POST /measurements" do

  before do
    @measurement = mock_model(Measurement, :to_param => "1")
    Measurement.stub!(:new).and_return(@measurement)
  end
  
  def post_with_successful_save
    @measurement.should_receive(:save).and_return(true)
    post :create, :measurement => {}
  end
  
  def post_with_failed_save
    @measurement.should_receive(:save).and_return(false)
    post :create, :measurement => {}
  end
  
  it "should create a new measurement" do
    Measurement.should_receive(:new).with({}).and_return(@measurement)
    post_with_successful_save
  end

  it "should redirect to the new measurement on successful save" do
    post_with_successful_save
    response.should redirect_to(measurement_url("1"))
  end

  it "should re-render 'new' on failed save" do
    post_with_failed_save
    response.should render_template('new')
  end
end

describe MeasurementsController, "handling PUT /measurements/1" do

  before do
    @measurement = mock_model(Measurement, :to_param => "1")
    Measurement.stub!(:find).and_return(@measurement)
  end
  
  def put_with_successful_update
    @measurement.should_receive(:update_attributes).and_return(true)
    put :update, :id => "1"
  end
  
  def put_with_failed_update
    @measurement.should_receive(:update_attributes).and_return(false)
    put :update, :id => "1"
  end
  
  it "should find the measurement requested" do
    Measurement.should_receive(:find).with("1").and_return(@measurement)
    put_with_successful_update
  end

  it "should update the found measurement" do
    put_with_successful_update
    assigns(:measurement).should equal(@measurement)
  end

  it "should assign the found measurement for the view" do
    put_with_successful_update
    assigns(:measurement).should equal(@measurement)
  end

  it "should redirect to the measurement on successful update" do
    put_with_successful_update
    response.should redirect_to(measurement_url("1"))
  end

  it "should re-render 'edit' on failed update" do
    put_with_failed_update
    response.should render_template('edit')
  end
end

describe MeasurementsController, "handling DELETE /measurements/1" do

  before do
    @measurement = mock_model(Measurement, :destroy => true)
    Measurement.stub!(:find).and_return(@measurement)
  end
  
  def do_delete
    delete :destroy, :id => "1"
  end

  it "should find the measurement requested" do
    Measurement.should_receive(:find).with("1").and_return(@measurement)
    do_delete
  end
  
  it "should call destroy on the found measurement" do
    @measurement.should_receive(:destroy)
    do_delete
  end
  
  it "should redirect to the measurements list" do
    do_delete
    response.should redirect_to(measurements_url)
  end
end
