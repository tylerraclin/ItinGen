require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryGirl.create(:user)
  end

  describe "creation" do
    it "can be created" do
      expect(@user).to be_valid
    end
  end

  describe "validations" do
    it "cannot be created without first_name" do
      @user.first_name = nil
      expect(@user).to_not be_valid
    end

    it "cannot be created without last_name" do
      @user.last_name = nil
      expect(@user).to_not be_valid
    end

    it "cannot be created without an email" do
      @user.phone = nil
      expect(@user).to_not be_valid
    end

    it 'email must have correct format' do
      @user.email = 'mygreatstr'
      expect(@user).to_not be_valid
    end

    it 'email must have correct domain' do
      @user.email = 'example@example.coooooooooooom'
      expect(@user).to_not be_valid
    end
  end
end
