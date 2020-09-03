RSpec.shared_examples "create example slots" do
  before do
    FactoryBot.create(
      :store,
      name: "Store 1",
      description: "store_description",
      status: 1,
      image_url: "image",
    )
  end
end