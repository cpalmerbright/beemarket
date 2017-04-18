require 'rails_helper'

RSpec.feature "Users can create new listings" do
  before do
    visit '/'
    click_link "New Listing"
  end
  scenario "with valid attributes" do
    fill_in "Quantity", with: 6
    fill_in "Species", with: "European Honey Bee"
    click_button "Create Listing"

    expect(page).to have_content "Listing has been created"
    expect(page).to have_content "European Honey Bee"
  end
  scenario "with invalid attributes" do
    click_button "Create Listing"
    expect(page).to have_content "Listing has not been created"
  end
end