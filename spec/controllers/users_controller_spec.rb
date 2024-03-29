# require File.dirname(__FILE__) + '/../spec_helper'
# 
# context "Routes for the UsersController should map" do
#   controller_name :users
# 
#   specify "{ :controller => 'users', :action => 'new' } to /users/new" do
#     route_for(:controller => "users", :action => "new").should eql("/users/new")
#   end
#   
#   specify "{ :controller => 'users', :action => 'create' } to /users" do
#     route_for(:controller => "users", :action => "create").should eql("/users")
#   end
#     
#   specify "{ :controller => 'users', :action => 'destroy', :id => 1} to /users/1" do
#     route_for(:controller => "users", :action => "destroy", :id => 1).should eql("/users/1")
#   end
#   
#   specify "{ :controller => 'users', :action => 'activate', :activation_code => 'code'} to /activate/code" do
#     route_for(:controller => "users", :action => "activate", :activation_code => "code").should eql("/activate/code")
#   end
# end
# 
# context "The Users controller on signup" do
#   controller_name :users
#   
#   specify "should be an UsersController" do
#     controller.should be_an_instance_of( UsersController)
#   end
#   
#   specify "should allow signup" do
#     lambda do 
#       create_user
#       response.should redirect_to('http://test.host/')
#     end.should change(User,:count).by(1)
#   end
# 
#   specify "should require login on signup" do
#     create_user :login => nil 
#     response.should be_success
#     assigns(:user).should have_at_least(1).errors_on(:login)
#   end
# 
#   specify "should require password on signup" do
#     create_user :password => nil
#     response.should be_success
#     assigns(:user).should have_at_least(1).errors_on(:password)
#   end
# 
#   specify "should require password confirmation on signup" do
#     create_user :password_confirmation => nil 
#     response.should be_success
#     assigns(:user).should have_at_least(1).errors_on(:password_confirmation)
#   end
# 
#   specify "should require email on signup" do
#     create_user :email => nil 
#     response.should be_success
#     assigns(:user).should have_at_least(1).errors_on(:email)
#   end
#   
#   specify "should fall back to new if save failed" do
#     post :create, :user => {}
#     response.should render_template('new')
#     assigns(:user).should have_at_least(1).errors
#   end
#   
#   protected
#   def create_user(options = {})
#     post :create, :user => { :login => 'quire', :email => 'quire@example.com', :password => 'quire', :password_confirmation => 'quire' }.merge(options)
#   end
# end
# 
# context "The Users controller on activate" do
#   controller_name :users
#   
#   setup do
#     @user = mock('user')
#   end
# 
#   specify "should enable unactivated user with valid activation code" do
#     @user.stub!(:id).and_return(1)
#     User.stub!(:find_by_activation_code).and_return(@user)
#     
#     @user.should_receive(:activated?).and_return(false)
#     @user.should_receive(:activate).and_return(true)
# 
#     get :activate, :activation_code => 'correct_activation_code'
#     response.should redirect_to('http://test.host/')
#     flash[:notice].should_not be_empty
#   end
#   
#   specify "should not enable activated user with valid activation code" do
#     User.stub!(:find_by_activation_code).and_return(@user)
#     @user.stub!(:id).and_return(1)
#     
#     @user.should_receive(:activated?).and_return(true)
#     @user.should_not_receive(:activate)
# 
#     get :activate, :activation_code => 'correct_activation_code'
#     response.should redirect_to('http://test.host/')
#   end
#   
#   specify "should not enable user with invalid activation code" do
#     User.stub!(:find_by_activation_code).and_return(nil)
#     
#     get :activate, :activation_code => 'invalid_activation_code'
#     response.should redirect_to('http://test.host/')
#   end
# end