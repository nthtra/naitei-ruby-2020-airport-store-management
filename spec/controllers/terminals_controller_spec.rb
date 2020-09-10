require "rails_helper"
require "spec_helper"

RSpec.describe TerminalsController, type: :controller do
  let!(:current_terminal) {FactoryBot.create :terminal}

  describe "GET #show" do
    before {get :show, params: {id: current_terminal.id}}

    it "should render view show" do
      expect(response).to render_template :show
    end
  end
end
