require "rails_helper"

RSpec.describe "Outings show page" do
  it "can remove a contestant from an outing" do
    #     User Story 5 of 7 - Remove a Contestant from an Outing
    bachelorette = Bachelorette.create!(name: "Sally Ride", season_number: 2, season_description: "Quazy")

    contestant1 = bachelorette.contestants.create!(name: "Brad Tailorman", age: 42, hometown: "Candy Mountain Ridge")
    contestant2 = bachelorette.contestants.create!(name: "Ian Bo", age: 37, hometown: "Tinalaska")

    hot_springs = contestant1.outings.create!(name: "Hot Springs", location: "Littleton", date: "5/2/1999")
    helicopter = contestant1.outings.create!(name: "Helicopter Ride", location: "Black Mountains", date: "9/51999")

    ContestantOuting.create!(contestant: contestant2, outing: helicopter)
    # As a visitor, 
    # When I visit an outings show page,
    visit outing_path(helicopter)
    # I see a link next to each contestant's name that says "Remove

    within("#contestant-#{contestant2.id}") do
      expect(page).to have_content("Ian Bo")
      expect(page).to have_link("Remove")
    end

    within("#contestant-#{contestant1.id}") do
      expect(page).to have_content("Brad Tailorman")
      expect(page).to have_link("Remove")
      # When I click that link, 
      click_link("Remove")
    end
    # I am redirected to the outing's show page
    expect(current_path).to eq(outing_path(helicopter))
    # Where I no longer see the name of that contestant listed. 
    expect(page).to_not have_content("Brad Tailorman")
    # When I visit a different outing's show page with that contestant, 
    visit outing_path(hot_springs)
    # I still see that contestant's name listed. 
    expect(page).to have_content("Brad Tailorman")
  end
end