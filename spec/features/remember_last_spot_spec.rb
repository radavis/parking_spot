require 'spec_helper'

feature "remember user's spot", %q{
  As a parker
  I want to know what spot I parked in yesterday
  So that I can determine if I'm parking in the same spot
} do

  # Acceptance Criteria:
  #
  # * If I parked yesterday, the system tells me where I parked yesterday
  #   when checking in.
  # * If I did not park yesterday, the system tells me that I did not park
  #   yesterday when checking in.

end


feature "suggest last spot", %q{
  AS a parker
  I want the system to suggest the last spot I parked in
  So that I don't have to re-enter the slot number
} do

  # Acceptance Criteria:
  #
  # * If I parked before today, the systems prefills my spot number with
  #   the spot I last parked in.
  # * If I have not parked, the system does not prefill the spot number.

end
