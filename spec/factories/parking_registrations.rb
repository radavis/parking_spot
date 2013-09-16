# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :parking_registration do
    first_name "Johnny"
    last_name "Mnemonic"
    email "johnny@infocarriers.io"
    spot_number 1
    parked_on "2013-09-16"
  end
end
