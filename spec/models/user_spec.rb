require 'spec_helper'

describe User do
  it "should authenticate with matching username and password" do
    user = Factory :user
    user.authenticate(user.password).should == user
  end

  it "should not authenticate with incorrect password" do
    user = Factory :user
    user.authenticate('incorrect password').should be_false
  end
end