require "rails_helper"

RSpec.describe "Contestant Show Page" do
  it "has contestant name, season number, season description, and list of outings" do
    # User Story 3 of 7 - Contestant's Show Page
    bachelorette = Bachelorette.create!(name: "Sally Ride", season_number: 2, season_description: "Quazy")
    contestant1 = bachelorette.contestants.create!(name: "Brad Tailorman", age: 42, hometown: "Candy Mountain Ridge")
    kickball = contestant1.outings.create!(name: "Kickball", location: "Dallas", date: "9/9/1999")
    hot_springs = contestant1.outings.create!(name: "Hot Springs", location: "Littleton", date: "5/2/1999")
    helicopter = contestant1.outings.create!(name: "Helicopter Ride", location: "Black Mountains", date: "9/51999")
    # As a visitor,
    # When I visit a contestants show page,
    visit contestant_path(contestant1)
    # I see that contestants name 
    expect(page).to have_content("Brad Tailorman")
    # as well as the season number and season description that this contestant was on.
    expect(page).to have_content("Season #2")
    expect(page).to have_content("Season Description: Quazy")
    # I also see a list of names of the outings that this contestant has been on while on the show.
    expect(page).to have_content("Outings: Kickball")
    expect(page).to have_content("Hot Springs")
    expect(page).to have_content("Helicopter Ride")
    # (e.g.
    #                         Ben Higgins
    # Season 20 - No wait, THIS is the most dramatic season yet
    # Outings: Kickball
    #         Hot Springs
    #         Helicopter Ride
    # )
    # When I click on an outing name, I'm taken to that outings show page
    click_link("Hot Springs")
    expect(current_path).to eq(outing_path(hot_springs))
  end
end