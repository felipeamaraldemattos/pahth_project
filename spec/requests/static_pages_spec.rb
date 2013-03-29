require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have base title" do
      visit root_path
      page.should have_selector('title',
                                :text => "Pahths")
    end
  end
end
