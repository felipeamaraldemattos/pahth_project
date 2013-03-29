require 'spec_helper'

describe "Static pages" do

  describe "Home page" do

    it "should have base title" do
      visit root_path
      page.should have_selector('title',
                                :text => "Pahths")
    end
  end

  describe "About page" do

    it "should have base title" do
      visit about_path
      page.should have_selector('title',
                                :text => "Pahths | About")
    end
  end



end
