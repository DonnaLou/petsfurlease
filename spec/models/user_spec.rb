require 'rails_helper'

RSpec.describe User, type: :model do
  describe "#sitter?" do
    it "defaults to false" do
      # setup 
      user = User.create!(email: 'kevin@test.com', password: 'pass1234', password_confirmation: 'pass1234')

      # exercise and verify
      expect(user.sitter?).to eq(false)
      
    end
  end
end
