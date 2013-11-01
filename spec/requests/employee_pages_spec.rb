require 'spec_helper'

describe "EmployeePages" , :type => :feature do
  describe "When I visit the homepage" do
    it "should have a welcome message" do
      visit root_path
      expect(page).to have_content("welcome to our company")
        end
      end
end
