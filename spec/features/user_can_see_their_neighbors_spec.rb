require 'spec_helper'

feature 'See your neighbors', %q{
  As a parker
  I want to see my two neighbors
  So that I can get to konw them better
} do

  # Acceptance Criteria:
  #
  # * After checking in, if I have a neighbor in a slot 1 below me,
  #   or one above me, I am informed of their name and what slot
  #   number they are currently in
  # * If I do not have anyone parking next to me, I am told that I
  #   have no current neighbors

end
