require "rails_helper"

RSpec.describe Contestant, type: :model do
  describe "relationships" do
    it {should belong_to :bachelorette}
    it { should have_many :contestant_outings }
    it { should have_many(:outings).through(:contestant_outings) }
  end

  describe "instance methods" do
    describe "#season_number" do
      it "returns the season number the contestant was on" do
        bachelorette = Bachelorette.create!(name: "Sally Ride", season_number: 2, season_description: "Quazy")
        contestant1 = bachelorette.contestants.create!(name: "Brad Tailorman", age: 42, hometown: "Candy Mountain Ridge")

        expect(contestant1.season_number).to eq(2)
      end
    end

    describe "#season_description" do
      it "returns the season number the contestant was on" do
        bachelorette = Bachelorette.create!(name: "Sally Ride", season_number: 2, season_description: "Quazy")
        contestant1 = bachelorette.contestants.create!(name: "Brad Tailorman", age: 42, hometown: "Candy Mountain Ridge")

        expect(contestant1.season_description).to eq("Quazy")
      end
    end
  end
end