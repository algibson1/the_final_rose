require "rails_helper"

RSpec.describe "Bachelorette Show Page" do 
  it "Shows a bachelorette's name, season number, and description of season" do
    # User Story 1 of 7 - Bachelorette Show Page & Bachelorette's Contestants Index
    bachelorette = Bachelorette.create!(name: "Sally Ride", season_number: 2, season_description: "Quazy")
    # As a visitor,
    # When I visit '/bachelorettes/:id',
    visit bachelorette_path(bachelorette)
    # I see that bachelorette's:
    # -Name
    expect(page).to have_content("Contestant: Sally Ride")
    # -Season Number
    expect(page).to have_content("Season #2")
    # -Description of Season that they were on
    expect(page).to have_content("Description: Quazy")
    # (e.g.             
    #                   Hannah Brown
    #     Season 15 - The Most Dramatic Season Yet!
    #   )
  end

  it "has a link to that bachelorette's contestants index" do
    bachelorette = Bachelorette.create!(name: "Sally Ride", season_number: 2, season_description: "Quazy")

    visit bachelorette_path(bachelorette)

    # I also see a link to see that bachelorette's contestants
    expect(page).to have_link("Bachelorette's Contestants Index")
  end
end