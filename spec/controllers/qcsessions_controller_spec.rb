require File.dirname(__FILE__) + '/../spec_helper'

describe QcsessionsController, "#route_for" do

  it "should map { :controller => 'qcsessions', :action => 'index' } to /qcsessions" do
    route_for(:controller => "qcsessions", :action => "index").should == "/qcsessions"
  end
  
  it "should map { :controller => 'qcsessions', :action => 'new' } to /qcsessions/new" do
    route_for(:controller => "qcsessions", :action => "new").should == "/qcsessions/new"
  end
  
  it "should map { :controller => 'qcsessions', :action => 'show', :id => 1 } to /qcsessions/1" do
    route_for(:controller => "qcsessions", :action => "show", :id => 1).should == "/qcsessions/1"
  end
  
  it "should map { :controller => 'qcsessions', :action => 'edit', :id => 1 } to /qcsessions/1/edit" do
    route_for(:controller => "qcsessions", :action => "edit", :id => 1).should == "/qcsessions/1/edit"
  end
  
  it "should map { :controller => 'qcsessions', :action => 'update', :id => 1} to /qcsessions/1" do
    route_for(:controller => "qcsessions", :action => "update", :id => 1).should == "/qcsessions/1"
  end
  
  it "should map { :controller => 'qcsessions', :action => 'destroy', :id => 1} to /qcsessions/1" do
    route_for(:controller => "qcsessions", :action => "destroy", :id => 1).should == "/qcsessions/1"
  end
  
end

describe QcsessionsController, "#params_from" do

  it "should generate params { :controller => 'qcsessions', action => 'index' } from GET /qcsessions" do
    params_from(:get, "/qcsessions").should == {:controller => "qcsessions", :action => "index"}
  end
  
  it "should generate params { :controller => 'qcsessions', action => 'new' } from GET /qcsessions/new" do
    params_from(:get, "/qcsessions/new").should == {:controller => "qcsessions", :action => "new"}
  end
  
  it "should generate params { :controller => 'qcsessions', action => 'create' } from POST /qcsessions" do
    params_from(:post, "/qcsessions").should == {:controller => "qcsessions", :action => "create"}
  end
  
  it "should generate params { :controller => 'qcsessions', action => 'show', id => '1' } from GET /qcsessions/1" do
    params_from(:get, "/qcsessions/1").should == {:controller => "qcsessions", :action => "show", :id => "1"}
  end
  
  it "should generate params { :controller => 'qcsessions', action => 'edit', id => '1' } from GET /qcsessions/1;edit" do
    params_from(:get, "/qcsessions/1/edit").should == {:controller => "qcsessions", :action => "edit", :id => "1"}
  end
  
  it "should generate params { :controller => 'qcsessions', action => 'update', id => '1' } from PUT /qcsessions/1" do
    params_from(:put, "/qcsessions/1").should == {:controller => "qcsessions", :action => "update", :id => "1"}
  end
  
  it "should generate params { :controller => 'qcsessions', action => 'destroy', id => '1' } from DELETE /qcsessions/1" do
    params_from(:delete, "/qcsessions/1").should == {:controller => "qcsessions", :action => "destroy", :id => "1"}
  end
  
end

describe QcsessionsController, "handling GET /qcsessions" do

  before do
    @qcsession = mock_model(Qcsession)
    Qcsession.stub!(:find).and_return([@qcsession])
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
  
  it "should find all qcsessions" do
    Qcsession.should_receive(:find).with(:all).and_return([@qcsession])
    do_get
  end
  
  it "should assign the found qcsessions for the view" do
    do_get
    assigns[:qcsessions].should == [@qcsession]
  end
end

describe QcsessionsController, "handling GET /qcsessions.xml" do

  before do
    @qcsession = mock_model(Qcsession, :to_xml => "XML")
    Qcsession.stub!(:find).and_return(@qcsession)
  end
  
  def do_get
    @request.env["HTTP_ACCEPT"] = "application/xml"
    get :index
  end
  
  it "should be successful" do
    do_get
    response.should be_success
  end

  it "should find all qcsessions" do
    Qcsession.should_receive(:find).with(:all).and_return([@qcsession])
    do_get
  end
  
  it "should render the found qcsessions as xml" do
    @qcsession.should_receive(:to_xml).and_return("XML")
    do_get
    response.body.should == "XML"
  end
end

describe QcsessionsController, "handling GET /qcsessions/1" do

  before do
    @qcsession = mock_model(Qcsession)
    Qcsession.stub!(:find).and_return(@qcsession)
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
  
  it "should find the qcsession requested" do
    Qcsession.should_receive(:find).with("1").and_return(@qcsession)
    do_get
  end
  
  it "should assign the found qcsession for the view" do
    do_get
    assigns[:qcsession].should equal(@qcsession)
  end
end

describe QcsessionsController, "handling GET /qcsessions/1.xml" do

  before do
    @qcsession = mock_model(Qcsession, :to_xml => "XML")
    Qcsession.stub!(:find).and_return(@qcsession)
  end
  
  def do_get
    @request.env["HTTP_ACCEPT"] = "application/xml"
    get :show, :id => "1"
  end

  it "should be successful" do
    do_get
    response.should be_success
  end
  
  it "should find the qcsession requested" do
    Qcsession.should_receive(:find).with("1").and_return(@qcsession)
    do_get
  end
  
  it "should render the found qcsession as xml" do
    @qcsession.should_receive(:to_xml).and_return("XML")
    do_get
    response.body.should == "XML"
  end
end

describe QcsessionsController, "handling GET /qcsessions/new" do

  before do
    @qcsession = mock_model(Qcsession)
    Qcsession.stub!(:new).and_return(@qcsession)
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
  
  it "should create an new qcsession" do
    Qcsession.should_receive(:new).and_return(@qcsession)
    do_get
  end
  
  it "should not save the new qcsession" do
    @qcsession.should_not_receive(:save)
    do_get
  end
  
  it "should assign the new qcsession for the view" do
    do_get
    assigns[:qcsession].should equal(@qcsession)
  end
end

describe QcsessionsController, "handling GET /qcsessions/1/edit" do

  before do
    @qcsession = mock_model(Qcsession)
    Qcsession.stub!(:find).and_return(@qcsession)
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
  
  it "should find the qcsession requested" do
    Qcsession.should_receive(:find).and_return(@qcsession)
    do_get
  end
  
  it "should assign the found Qcsession for the view" do
    do_get
    assigns[:qcsession].should equal(@qcsession)
  end
end

describe QcsessionsController, "handling POST /qcsessions" do

  before do
    @qcsession = mock_model(Qcsession, :to_param => "1")
    Qcsession.stub!(:new).and_return(@qcsession)
  end
  
  def post_with_successful_save
    @qcsession.should_receive(:save).and_return(true)
    post :create, :qcsession => {}
  end
  
  def post_with_failed_save
    @qcsession.should_receive(:save).and_return(false)
    post :create, :qcsession => {}
  end
  
  it "should create a new qcsession" do
    Qcsession.should_receive(:new).with({}).and_return(@qcsession)
    post_with_successful_save
  end

  it "should redirect to the new qcsession on successful save" do
    post_with_successful_save
    response.should redirect_to(qcsession_url("1"))
  end

  it "should re-render 'new' on failed save" do
    post_with_failed_save
    response.should render_template('new')
  end
end

describe QcsessionsController, "handling PUT /qcsessions/1" do

  before do
    @qcsession = mock_model(Qcsession, :to_param => "1")
    Qcsession.stub!(:find).and_return(@qcsession)
  end
  
  def put_with_successful_update
    @qcsession.should_receive(:update_attributes).and_return(true)
    put :update, :id => "1"
  end
  
  def put_with_failed_update
    @qcsession.should_receive(:update_attributes).and_return(false)
    put :update, :id => "1"
  end
  
  it "should find the qcsession requested" do
    Qcsession.should_receive(:find).with("1").and_return(@qcsession)
    put_with_successful_update
  end

  it "should update the found qcsession" do
    put_with_successful_update
    assigns(:qcsession).should equal(@qcsession)
  end

  it "should assign the found qcsession for the view" do
    put_with_successful_update
    assigns(:qcsession).should equal(@qcsession)
  end

  it "should redirect to the qcsession on successful update" do
    put_with_successful_update
    response.should redirect_to(qcsession_url("1"))
  end

  it "should re-render 'edit' on failed update" do
    put_with_failed_update
    response.should render_template('edit')
  end
end

describe QcsessionsController, "handling DELETE /qcsessions/1" do

  before do
    @qcsession = mock_model(Qcsession, :destroy => true)
    Qcsession.stub!(:find).and_return(@qcsession)
  end
  
  def do_delete
    delete :destroy, :id => "1"
  end

  it "should find the qcsession requested" do
    Qcsession.should_receive(:find).with("1").and_return(@qcsession)
    do_delete
  end
  
  it "should call destroy on the found qcsession" do
    @qcsession.should_receive(:destroy)
    do_delete
  end
  
  it "should redirect to the qcsessions list" do
    do_delete
    response.should redirect_to(qcsessions_url)
  end
end
