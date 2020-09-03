RSpec.shared_examples "create example slots" do
  before do
    FactoryBot.create(
      :slot,
      name: "Slot 1",
      area: 200,
      is_empty: false,
      price: 200,
      description: "Test Description 1"
    )
    FactoryBot.create(
      :slot,
      name: "Slot 2",
      area: 200,
      is_empty: false,
      price: 200,
      description: "Test Description 2"
    )
    FactoryBot.create(
      :slot,
      name: "Slot 3",
      area: 200,
      is_empty: true,
      price: 200,
      description: "Test Description 3"
    )
    FactoryBot.create(
      :slot,
      name: "Slot 4",
      area: 200,
      is_empty: true,
      price: 200,
      description: "Test Description 4"
    )
  end
end