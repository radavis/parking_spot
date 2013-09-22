require 'spec_helper'

describe ParkingRegistration do
  it { should have_valid(:email).when('user@example.com', 'user+2@another.com') }
  it { should_not have_valid(:email).when(nil, '', 'foo') }

  it { should have_valid(:first_name).when('John', 'Dan') }
  it { should_not have_valid(:first_name).when(nil, '') }

  it { should have_valid(:last_name).when('Smith', 'Sun') }
  it { should_not have_valid(:last_name).when(nil, '') }

  it { should have_valid(:spot_number).when(5, 20) }
  it { should_not have_valid(:spot_number).when(0, 61) }

  it { should have_valid(:parked_on).when(Date.today) }
  it { should_not have_valid(:parked_on).when(nil, '') }

  describe 'parking' do
    it 'parks the car for today' do
      registration = FactoryGirl.build(:parking_registration, parked_on: nil)
      expect(registration.park).to eql(true)
      expect(registration.parked_on).to eql(Date.today)
    end
  end

  describe 'neighbors' do

    it 'has a neighbor if above' do
      low_neighbor = FactoryGirl.create(:parking_registration,
        spot_number: 5)
      reg = FactoryGirl.build(:parking_registration,
        spot_number: 6)
      expect(reg.neighbors).to eql([low_neighbor, nil])
    end

    it 'has a neighbor if below' do
      high_neighbor = FactoryGirl.create(:parking_registration,
        spot_number: 7)
      reg = FactoryGirl.build(:parking_registration,
        spot_number: 6)
      expect(reg.neighbors).to eql([nil, high_neighbor])
    end

    it 'has no neighbors if no one near me' do
      FactoryGirl.create(:parking_registration,
        spot_number: 10)
      reg = FactoryGirl.build(:parking_registration,
        spot_number: 20)
      expect(reg.neighbors).to eql([nil, nil])
    end
  end
end
