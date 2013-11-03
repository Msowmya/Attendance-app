FactoryGirl.define do
  factory :employee do
    name     "Michael Hartl"
    email    "michael@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
  factory :event do
    event_name "Lorem ipsum"
    employee
  end
end

