class ParkingRegistration < ActiveRecord::Base
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :spot_number
  validates_presence_of :parked_on

  validates_format_of :email, with: /.+\@.+\..+/

  validates_numericality_of :spot_number,
    only_integer: true,
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 60

  def park
    if occupied?(spot_number)
      errors.add(:spot_number, "Sorry, this spot is taken.")
      return false
    end
    self.parked_on = Date.today
    save
  end

  def occupied?(spot)
    ParkingRegistration.where(spot_number: spot).where(parked_on: Date.today).any?
  end

  def neighbors
    low_neighbor = ParkingRegistration.where({
        spot_number: self.spot_number - 1,
        parked_on: self.parked_on
        }).first

    high_neighbor = ParkingRegistration.where({
        spot_number: self.spot_number + 1,
        parked_on: self.parked_on
        }).first

    [low_neighbor, high_neighbor]
  end
end
