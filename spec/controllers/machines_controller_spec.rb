require File.dirname(__FILE__) + '/../spec_helper'

describe MachinesController, "#route_for" do

  it "should map { :controller => 'machines', :action => 'index' } to /machines" do
    route_for(:controller => "machines", :action => "index").should == "/machines"
  end
  
  it "should map { :controller => 'machines', :action => 'new' } to /machines/new" do
    route_for(:controller => "machines", :action => "new").should == "/machines/new"
  end
  
  it "should map { :controller => 'machines', :action => 'show', :id => 1 } to /machines/1" do
    route_for(:controller => "machines", :action => "show", :id => 1).should == "/machines/1"
  end
  
  it "should map { :controller => 'machines', :action => 'edit', :id => 1 } to /machines/1/edit" do
    route_for(:controller => "machines", :action => "edit", :id => 1).should == "/machines/1/edit"
  end
  
  it "should map { :controller => 'machines', :action => 'update', :id => 1} to /machines/1" do
    route_for(:controller => "machines", :action => "update", :id => 1).should == "/machines/1"
  end
  
  it "should map { :controller => 'machines', :action => 'destroy', :id => 1} to /machines/1" do
    route_for(:controller => "machines", :action => "destroy", :id => 1).should == "/machines/1"
  end
  
end

describe MachinesController, "#params_from" do

  it "should generate params { :controller => 'machines', action => 'index' } from GET /machines" do
    params_from(:get, "/machines").should == {:controller => "machines", :action => "index"}
  end
  
  it "should generate params { :controller => 'machines', action => 'new' } from GET /machines/new" do
    params_from(:get, "/machines/new").should == {:controller => "machines", :action => "new"}
  end
  
  it "should generate params { :controller => 'machines', action => 'create' } from POST /machines" do
    params_from(:post, "/machines").should == {:controller => "machines", :action => "create"}
  end
  
  it "should generate params { :controller => 'machines', action => 'show', id => '1' } from GET /machines/1" do
    params_from(:get, "/machines/1").should == {:controller => "machines", :action => "show", :id => "1"}
  end
  
  it "should generate params { :controller => 'machines', action => 'edit', id => '1' } from GET /machines/1;edit" do
    params_from(:get, "/machines/1/edit").should == {:controller => "machines", :action => "edit", :id => "1"}
  end
  
  it "should generate params { :controller => 'machines', action => 'update', id => '1' } from PUT /machines/1" do
    params_from(:put, "/machines/1").should == {:controller => "machines", :action => "update", :id => "1"}
  end
  
  it "should generate params { :controller => 'machines', action => 'destroy', id => '1' } from DELETE /machines/1" do
    params_from(:delete, "/machines/1").should == {:controller => "machines", :action => "destroy", :id => "1"}
  end
  
end

describe MachinesController, "handling GET /machines" do

  before do
    @machine = mock_model(Machine)
    Machine.stub!(:find).and_return([@machine])
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
  
  it "should find all machines" do
    Machine.should_receive(:find).with(:all).and_return([@machine])
    do_get
  end
  
  it "should assign the found machines for the view" do
    do_get
    assigns[:machines].should == [@machine]
  end
end

describe MachinesController, "handling GET /machines.xml" do

  before do
    @machine = mock_model(Machine, :to_xml => "XML")
    Machine.stub!(:find).and_return(@machine)
  end
  
  def do_get
    @request.env["HTTP_ACCEPT"] = "application/xml"
    get :index
  end
  
  it "should be successful" do
    do_get
    response.should be_success
  end

  it "should find all machines" do
    Machine.should_receive(:find).with(:all).and_return([@machine])
    do_get
  end
  
  it "should render the found machines as xml" do
    @machine.should_receive(:to_xml).and_return("XML")
    do_get
    response.body.should == "XML"
  end
end

describe MachinesController, "handling GET /machines/1" do

  before do
    @machine = mock_model(Machine)
    Machine.stub!(:find).and_return(@machine)
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
  
  it "should find the machine requested" do
    Machine.should_receive(:find).with("1").and_return(@machine)
    do_get
  end
  
  it "should assign the found machine for the view" do
    do_get
    assigns[:machine].should equal(@machine)
  end
end

describe MachinesController, "handling GET /machines/1.xml" do

  before do
    @machine = mock_model(Machine, :to_xml => "XML")
    Machine.stub!(:find).and_return(@machine)
  end
  
  def do_get
    @request.env["HTTP_ACCEPT"] = "application/xml"
    get :show, :id => "1"
  end

  it "should be successful" do
    do_get
    response.should be_success
  end
  
  it "should find the machine requested" do
    Machine.should_receive(:find).with("1").and_return(@machine)
    do_get
  end
  
  it "should render the found machine as xml" do
    @machine.should_receive(:to_xml).and_return("XML")
    do_get
    response.body.should == "XML"
  end
end

describe MachinesController, "handling GET /machines/new" do

  before do
    @machine = mock_model(Machine)
    Machine.stub!(:new).and_return(@machine)
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
  
  it "should create an new machine" do
    Machine.should_receive(:new).and_return(@machine)
    do_get
  end
  
  it "should not save the new machine" do
    @machine.should_not_receive(:save)
    do_get
  end
  
  it "should assign the new machine for the view" do
    do_get
    assigns[:machine].should equal(@machine)
  end
end

describe MachinesController, "handling GET /machines/1/edit" do

  before do
    @machine = mock_model(Machine)
    Machine.stub!(:find).and_return(@machine)
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
  
  it "should find the machine requested" do
    Machine.should_receive(:find).and_return(@machine)
    do_get
  end
  
  it "should assign the found Machine for the view" do
    do_get
    assigns[:machine].should equal(@machine)
  end
end

describe MachinesController, "handling POST /machines" do

  before do
    @machine = mock_model(Machine, :to_param => "1")
    Machine.stub!(:new).and_return(@machine)
  end
  
  def post_with_successful_save
    @machine.should_receive(:save).and_return(true)
    post :create, :machine => {}
  end
  
  def post_with_failed_save
    @machine.should_receive(:save).and_return(false)
    post :create, :machine => {}
  end
  
  it "should create a new machine" do
    Machine.should_receive(:new).with({}).and_return(@machine)
    post_with_successful_save
  end

  it "should redirect to the new machine on successful save" do
    post_with_successful_save
    response.should redirect_to(machine_url("1"))
  end

  it "should re-render 'new' on failed save" do
    post_with_failed_save
    response.should render_template('new')
  end
end

describe MachinesController, "handling PUT /machines/1" do

  before do
    @machine = mock_model(Machine, :to_param => "1")
    Machine.stub!(:find).and_return(@machine)
  end
  
  def put_with_successful_update
    @machine.should_receive(:update_attributes).and_return(true)
    put :update, :id => "1"
  end
  
  def put_with_failed_update
    @machine.should_receive(:update_attributes).and_return(false)
    put :update, :id => "1"
  end
  
  it "should find the machine requested" do
    Machine.should_receive(:find).with("1").and_return(@machine)
    put_with_successful_update
  end

  it "should update the found machine" do
    put_with_successful_update
    assigns(:machine).should equal(@machine)
  end

  it "should assign the found machine for the view" do
    put_with_successful_update
    assigns(:machine).should equal(@machine)
  end

  it "should redirect to the machine on successful update" do
    put_with_successful_update
    response.should redirect_to(machine_url("1"))
  end

  it "should re-render 'edit' on failed update" do
    put_with_failed_update
    response.should render_template('edit')
  end
end

describe MachinesController, "handling DELETE /machines/1" do

  before do
    @machine = mock_model(Machine, :destroy => true)
    Machine.stub!(:find).and_return(@machine)
  end
  
  def do_delete
    delete :destroy, :id => "1"
  end

  it "should find the machine requested" do
    Machine.should_receive(:find).with("1").and_return(@machine)
    do_delete
  end
  
  it "should call destroy on the found machine" do
    @machine.should_receive(:destroy)
    do_delete
  end
  
  it "should redirect to the machines list" do
    do_delete
    response.should redirect_to(machines_url)
  end
end
