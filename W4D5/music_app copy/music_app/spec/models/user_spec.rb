require 'rails_helper'

RSpec.describe User, type: :model do

  subject(:user) {User.new(email: 'hello@hello.com', password: 'password')}

  description 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password_digest) }
    it "should validate the length of password > 6" do
      short_password_user =
        User.new(email: 'hello@hellome.com', password: '')
      expect(short_password_user.errors[:password]).to eq('Password cannot be shorted than 6 characters')
    end

    it "returns the new session token" do
      expect(user.reset_session_token!).to eq(user.session_token)
    end
  end

  describe "#is_password?" do
    it "verifies correct password" do
      expect(user.is_password?("password")).to be true
    end

    it "verifies a password is not correct" do
      expect(user.is_password?("not_my_password")).to be false
    end
  end

  describe ".find_by_credentials" do

    it "returns user" do
      expect(User.find_by_credentials("hello@hello.com", "password")).to eq(user)
    end

    it "returns nil if user not found" do
      expect(User.find_by_credentials("goodbye@goodbye.com", "not_my_password")).to eq(nil)
    end
  end

end
