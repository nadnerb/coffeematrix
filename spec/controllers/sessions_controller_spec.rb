require 'spec_helper'

describe SessionsController do

  describe '#create' do

    it 'should create a new session with a valid user' do

      controller.should_receive(:login).with('foo', 'bar').and_return(true)

      get :create, :username => 'foo', :password => 'bar'

      response.should redirect_to(root_url)
      flash[:notice].should == "Successfully logged in"
    end

    it 'should not create a new session with an invalid user' do

      controller.should_receive(:login).with('foo', 'bar').and_return(false)

      get :create, :username => 'foo', :password => 'bar'

      response.should render_template(:new)
      flash[:alert].should == "Username or password was invalid"
    end

  end

  describe '#destroy' do

    it 'should log out user' do

      controller.should_receive(:logout)

      get :destroy

      response.should redirect_to(root_url)
      flash[:notice].should == "Successfully logged out"
    end

  end
end
