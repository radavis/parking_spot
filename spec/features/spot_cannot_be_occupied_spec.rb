require 'spec_helper'

feature "Cannot park in reserved spot", %q{
  As a parker
  I cannot check into a spot that has already been checked in
  So that two cars are not parked in the same spot
} do

  # Acceptance Criteria:
  # * If I specify a parking spot that has already been checked in
  #   for the day, I am told that I can't check in there.
  # * If I specify a spot that hasn't yet been parked in today,
  #   I am able to check in.

  scenario "spot is taken" do
    FactoryGirl.create(:parking_registration, { spot_number: 15 })

    visit '/'
    fill_in 'First name', with: 'Harry'
    fill_in 'Last name', with: 'Potter'
    fill_in 'Spot number', with: 15
    fill_in 'Email', with: 'hp@magic.com'
    click_button 'Register'

    expect(page).to have_content('Sorry, this spot is taken.')
  end

end
