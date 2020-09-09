require "rails_helper"

RSpec.describe Employee, type: :model do
  
  let(:role) {FactoryBot.create :role}
  let(:unit) {FactoryBot.create :unit}
  let!(:employee) {FactoryBot.create :employee, unit_id: unit.id}

  let!(:employee_true) {FactoryBot.build :employee, unit_id: unit.id}
  let!(:employee_fail) {FactoryBot.build :employee, unit_id: nil}

  describe "Associations" do
    it "should has many terminals" do
      is_expected.to have_many(:terminals).dependent(:destroy)
    end

    it "should belongs to unit" do
      is_expected.to belong_to(:unit)
    end
  end

  describe "Validations" do
    context "when all required fields given" do
      it "should be true" do
        expect(employee_true.valid?).to eq true
      end
    end

    context "when missing required fields" do
      it "should be false" do
        expect(employee_fail.valid?).to eq false
      end
    end
  end
end
