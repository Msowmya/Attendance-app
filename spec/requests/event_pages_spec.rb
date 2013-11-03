require 'spec_helper'

describe "EventPages" do
  subject { page }

  let(:employee) { FactoryGirl.create(:employee) }
  before { sign_in employee }

  describe "event creation" do
    before { visit root_path }

    describe "with invalid information" do

      it "should not create a event" do
        expect { click_button "Post" }.not_to change(Event, :count)
      end

      describe "error messages" do
        before { click_button "Post" }
        it { should have_content('error') }
      end
    end

    describe "with valid information" do

      before { fill_in 'event_event_name', with: "Lorem ipsum" }
      it "should create a event" do
        expect { click_button "Post" }.to change(Event, :count).by(1)
      end
    end
  end
end
