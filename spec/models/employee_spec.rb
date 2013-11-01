require 'spec_helper'

describe Employee do
  before do
    @employee = Employee.new(name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
  end

  subject { @employee }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:remember_token) }
  it { should respond_to(:authenticate) }

  it { should be_valid }

  describe "when name is not present" do
    before { @employee.name = " " }
    it { should_not be_valid }
  end
  describe "when email is not present" do
    before { @employee.email = " " }
    it { should_not be_valid }
  end
  describe "when name is too long" do
    before { @employee.name = "a" * 51 }
    it { should_not be_valid }
  end
  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @employee.email = invalid_address
        expect(@employee).not_to be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @employee.email = valid_address
        expect(@employee).to be_valid
      end
    end
  end
  describe "when email address is already taken" do
    before do
      employee_with_same_email = @employee.dup
      employee_with_same_email.email = @employee.email.upcase
      employee_with_same_email.save
    end

    it { should_not be_valid }
  end
  describe "when password is not present" do
    before do
      @employee = Employee.new(name: "Example User", email: "user@example.com",
                       password: " ", password_confirmation: " ")
    end
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before { @employee.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end
  describe "with a password that's too short" do
    before { @employee.password = @employee.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end

  describe "return value of authenticate method" do
    before { @employee.save }
    let(:found_employee) { Employee.find_by(email: @employee.email) }

    describe "with valid password" do
      it { should eq found_employee.authenticate(@employee.password) }
    end

    describe "with invalid password" do
      let(:employee_for_invalid_password) { found_employee.authenticate("invalid") }

      it { should_not eq employee_for_invalid_password }
      specify { expect(employee_for_invalid_password).to be_false }
    end
  end

  describe "remember token" do
    before { @employee.save }
    its(:remember_token) { should_not be_blank }
  end

end
