require 'spec_helper'

describe "AuthenticationPages" do
  subject { page }

  describe "signin page" do
    before { visit signin_path }

    it { should have_content('Sign in') }
  end
  describe "signin" do
    before { visit signin_path }

    describe "with invalid information" do
      before { click_button "Sign in" }

      it { should have_content('Sign in') }

    end
    describe "with valid information" do
      let(:employee) { FactoryGirl.create(:employee) }
      before do
        fill_in "Email",    with: employee.email.upcase
        fill_in "Password", with: employee.password
        click_button "Sign in"
      end

      it { should have_content(employee.name) }
      it { should have_link('Sign out',    href: signout_path) }
      it { should_not have_link('Sign in', href: signin_path) }
    end
  end


  end
