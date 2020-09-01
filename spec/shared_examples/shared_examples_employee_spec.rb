RSpec.shared_examples "create example employees" do
  before do
    FactoryBot.create(
      :employee,
      name: "Test Employee 0",
      email: "employee@test.com",
      unit_id: 1,
      role_id: 1
    )
    FactoryBot.create(
      :employee,
      name: "Test Employee 1",
      email: "employee2@test.com",
      unit_id: 1,
      role_id: 1
    )
  end
end
