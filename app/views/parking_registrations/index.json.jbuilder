json.array!(@parking_registrations) do |parking_registration|
  json.extract! parking_registration, :first_name, :last_name, :email, :spot_number, :parked_on
  json.url parking_registration_url(parking_registration, format: :json)
end
