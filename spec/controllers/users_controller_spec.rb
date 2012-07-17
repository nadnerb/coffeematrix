require 'spec_helper'

describe UsersController do

  describe '#create' do

    before do
      @user = mock_model(User)
      User.should_receive(:new).with('really is a user').and_return @user
    end

    it 'should create new new user' do
      @user.should_receive(:save).and_return(true)

      get :create, :user => 'really is a user'

      response.should redirect_to(root_url)
      flash[:notice].should == "Successfully signed up"
    end

    it 'should not create new session with an invalid user' do

      @user.should_receive(:save).and_return(false)

      get :create, :user => 'really is a user'

      response.should render_template(:new)
    end

  end

  describe '#new' do

    it 'should log out user' do
      User.should_receive(:new)

      get :new
    end

  end
end
