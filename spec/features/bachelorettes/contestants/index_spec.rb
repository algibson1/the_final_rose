require "rails_helper"

RSpec.describe "Bachelorette's Contestants Index" do
  it "displays all a bachelorette's contestants" do 
    bachelorette = Bachelorette.create!(name: "Sally Ride", season_number: 2, season_description: "Quazy")
    contestant1 = bachelorette.contestants.create!(name: "Brad Tailorman", age: 42, hometown: "Candy Mountain Ridge")
    contestant2 = bachelorette.contestants.create!(name: "Ian Bo", age: 37, hometown: "Tinalaska")
    bachelorette2 = Bachelorette.create!(name: "Brainy", season_number: 4, season_description: "Wowzers")
    contestant3 = Contestant.create!(name: "asfgdh", age: 645, hometown: "somewhere", bachelorette: bachelorette2)


    visit bachelorette_path(bachelorette)
    # I also see a link to see that bachelorette's contestants
    # When I click on that link
    click_link("Bachelorette's Contestants Index")
    # I'm taken to "/bachelorettes/:bachelorette_id/contestants"
    expect(current_path).to eq(bachelorette_contestants_path(bachelorette))
    # and I can see only that bachelorette's contestants
    expect(page).to have_content(contestant1.name)
    expect(page).to have_content(contestant2.name)
    expect(page).to_not have_content(contestant3.name)
  end

  it "displays names, ages, and hometowns of a bachelorette's contestants" do
    # User Story 2 of 7 - Bachelorette's Contestants Index
    bachelorette = Bachelorette.create!(name: "Sally Ride", season_number: 2, season_description: "Quazy")
    contestant1 = bachelorette.contestants.create!(name: "Brad Tailorman", age: 42, hometown: "Candy Mountain Ridge")
    contestant2 = bachelorette.contestants.create!(name: "Ian Bo", age: 37, hometown: "Tinalaska")
    # As a visitor,
    # When I visit a bachelorette's contestants index '/bachelorettes/:bachelorette_id/contestants',
    visit bachelorette_contestants_path(bachelorette)
    # I see the names of that bachelorette's contestants along with the following information:
    # -Age
    # -Hometown
    # (e.g. "Name: Pilot Pete, Age: 34, Hometown: Irving, TX")
    expect(page).to have_content("Name: Brad Tailorman, Age: 42, Hometown: Candy Mountain Ridge")
    expect(page).to have_content("Name: Ian Bo, Age: 37, Hometown: Tinalaska")

    # And I can click on any contestants name (as a link) to go to that contestants show page "/contestants/:id"
    click_link("Brad Tailorman")
    expect(current_path).to eq(contestant_path(contestant1))
  end
end