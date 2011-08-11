require 'spec_helper'

describe "Bookmarks" do
  describe "GET /bookmarks" do
    it "works! (now write some real specs)" do
      user = Factory(:user)
      visit new_bookmark_path
      current_path.should eq(new_bookmark_path)
      click_button 'Create'
    end
  end
end
