require 'spec_helper'

describe "Auths" do
  describe "GET /auths" do
    let(:user) { FactoryGirl.create(:user,
                                    :email => 'hede@hede.com',
                                    :password => 'hedelek',
                                    :password_confirmation => 'hedelek') }

    it "user can login with correct password and sees the bookmarks" do
      login_as user
      current_path.should eq(root_path)
      page.should have_content(user.email)
    end

    it "should go to bookmarks path" do
      login_as user
      visit bookmarks_path
      current_path.should eq(bookmarks_path)
    end

    def login_as user
      visit new_session_path
      fill_in 'email', :with => user.email
      fill_in 'password', :with => user.password
      click_button 'Log in'
    end
  end
end
