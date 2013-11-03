require 'spec_helper'

describe Event do
  let(:employee) { FactoryGirl.create(:employee) }
  before { @event = employee.events.build(event_name: "Lorem ipsum") }

  subject { @event }

  it { should respond_to(:event_name) }
  it { should respond_to(:employee_id) }
  it { should respond_to(:employee) }
  its(:employee) { should eq employee }

  it { should be_valid }

  describe "when employee_id is not present" do
    before { @event.employee_id = nil }
    it { should_not be_valid }
  end

  describe "with blank event_name" do
    before { @event.event_name = " " }
    it { should_not be_valid }
  end

  describe "with event_name that is too long" do
    before { @event.event_name = "a" * 51 }
    it { should_not be_valid }
  end
end
