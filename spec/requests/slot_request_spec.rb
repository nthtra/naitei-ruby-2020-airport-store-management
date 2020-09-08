RSpec.describe SlotsController, type: :controller do
  let!(:current_slot) {FactoryBot.create :slot}

  describe "GET #index" do
    it "has a 200 status code" do
      get :index
      expect(response.status).to eq(200)
    end
  end

  describe "GET #show" do
    context "when slot valid" do
      before {get :show, params: {id: current_slot.id}}

      it "should render view show" do
        expect(response).to render_template :show
      end
    end
  end
end
