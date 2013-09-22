require 'spec_helper'

feature 'See your neighbors', %q{
  As a parker
  I want to see my two neighbors
  So that I can get to know them better
} do

  # Acceptance Criteria:
  #
  # * After checking in, if I have a neighbor in a slot 1 below me,
  #   or one above me, I am informed of their name and what slot
  #   number they are currently in
  # * If I do not have anyone parking next to me, I am told that I
  #   have no current neighbors

  scenario 'no neighbors present' do
    create_registration_for(5)
    expect(page).to have_content('You have no neighbors')
  end

  scenario 'a neighbor with a spot one less than me' do
    FactoryGirl.create(:parking_registration,
      first_name: 'Sam',
      spot_number: 4)
    create_registration_for(5)
    expect(page).to have_content('Sam')
  end

  scenario 'a neighbor with a spot one more than me' do
    FactoryGirl.create(:parking_registration,
      first_name: 'Jenny',
      spot_number: 20)
    create_registration_for(19)
    expect(page).to have_content('Jenny')
  end

  scenario 'a neighbor that is not in immediate proximity'

  def create_registration_for(spot_number)
    visit '/'
    fill_in 'First name', with: 'John'
    fill_in 'Last name', with: 'Smith'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Spot number', with: spot_number
    click_button 'Register'
  end
end
