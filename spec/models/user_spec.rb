require 'spec_helper'

describe User do

  before { @user = User.new(name: "Stinge", email: "stinge62580@gmail.com") }
   
  
  subject { @user }
  
  it { should respond_to(:name)  }
  it { should respond_to(:email) }

  it { should be_valid }

  describe "when name is not present" do
    before { @user.name = " " }
    it { should_not be_valid } 
  end
end

