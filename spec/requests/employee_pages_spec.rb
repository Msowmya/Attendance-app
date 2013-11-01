require 'spec_helper'

describe "EmployeePages" , :type => :feature do
  subject { page }

  describe "profile page" do
    let(:employee) { FactoryGirl.create(:employee) }
    before { visit employee_path(employee) }

    it { should have_content(employee.name) }

  end

  describe "signup page" do
    before { visit signup_path }

    it { should have_content('Sign up') }

  end
  describe "signup" do

    before { visit signup_path }

    let(:submit) { "Create my account" }

    describe "with invalid information" do
      it "should not create a employee" do
        expect { click_button submit }.not_to change(Employee, :count)
      end
    end

    describe "with valid information" do
      before do
        fill_in "Name",         with: "Example User"
        fill_in "Email",        with: "user@example.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "should create a employee" do
        expect { click_button submit }.to change(Employee, :count).by(1)
      end
    end
  end

  end
