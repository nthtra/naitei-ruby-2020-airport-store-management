RSpec.shared_examples "create example users" do
  before do
    FactoryBot.create(
      :user,
      name: "Test User 1",
      email: "user1@test.com",
      phone_number: "0885656556",
      identity_number: "12345678976",
      company_name: "Test 1"
    )
    FactoryBot.create(
      :user,
      name: "Test User 2",
      email: "user2@test.com",
      phone_number: "0885652356",
      identity_number: "12345672376",
      company_name: "Test 2"
    )
    FactoryBot.create(
      :user,
      name: "Test User 3",
      email: "user3@test.com",
      phone_number: "0885566556",
      identity_number: "12345238976",
      company_name: "Test 3"
    )
  end
end
