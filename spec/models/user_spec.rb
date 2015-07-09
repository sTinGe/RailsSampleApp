require 'spec_helper'

describe User do

  before do
    @user = User.new(name: "Stinge", 
                     email: "stinge62580@gmail.com",
                     password: "foobar",
                     password_confirmation: "foobar")
  end 
  
  subject { @user }
  
  it { should respond_to(:name)  }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }

  it { should be_valid }

  describe "when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid } 
  end

  describe "when name is too long" do
    before { @user.name = "a" * 51 }
    it { should_not be_valid }
  end

  describe "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end

    it { should_not be_valid }
  end

  describe "when password is not present" do
    before do
      @user = User.new(name: "Example User",
                       email: "user@example.com",
                       password: " ",
                       password_confirmation: " ")
    end
  end
  describe "when password doesn't match confirmation" do
    before { @user.password_confirmation = "mismatch" }

    it { should be_invalid }
  end

  describe "with a password that's too short" do
    before { @user.password = @user.password_confirmation = "a" * 5 }
    
    it { should be_invalid }
  end

  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by(email: @user.email) }

    describe "with valid password" do
      it { should eq found_user.authenticate(@user.password) }
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }

      it { should_not eq user_for_invalid_password }
      specify { expect(user_for_invalid_password).to be_falsey }
    end
  end

  describe "User pages" do
    subject { pages }
    describe "signup pages" do
      before { visit signup_path }
      it { should have_content('Sign up') }
      it { should have_title(full_title('Sign up')) }
    end
  end

  describe "profile page" do
    before { visit user_path(user) }

    it { should have_content(user.name) }
    it { should have_title(user.name) }
  end
end

