require 'spec_helper'

feature "Remembers email address", %q{
  As a parker
  I want the system to remember my email
  So that I don't have to re-enter it
} do

  # Acceptance Criteria:
  # * If I have previously checkin via the same web browser,
  #   my email is remembered so that I don't have to
  #   re-enter it
  # * If I have not previously checked in, the email address
  #   field is left blank

  scenario "user has entered email previously" do
    pending "not implemented yet"
    visit '/'

    fill_in 'First name', with: 'Harry'
    fill_in 'Last name', with: 'Potter'
    fill_in 'Spot number', with: 15
    fill_in 'Email', with: 'hp@magic.com'
    click_button 'Register'

    visit '/'
    expect(page).to have_content('hp@magic.com')
  end

end
