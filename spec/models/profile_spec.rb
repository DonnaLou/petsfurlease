require 'rails_helper'

RSpec.describe Profile, type: :model do
  before :each do
    # One time setup
    create(:profile, :profile_92104)
    create(:profile, :profile_92128)
  end

  context "when searching for sitters" do
    it "searches for profiles with no params" do
      profiles = Profile.search

      expect(profiles.count).to eq(2)
    end

    it "searches for profiles in zipcode" do
      profiles = Profile.search(zip: '92104')

      expect(profiles.count).to eq(1)
    end

    it "returns 0 results when no records match" do
      profiles = Profile.search(zip: '92222')

      expect(profiles.count).to eq(0)
    end

  end
end
