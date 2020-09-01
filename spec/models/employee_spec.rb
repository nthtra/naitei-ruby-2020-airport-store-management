require "rails_helper"

RSpec.describe Employee, type: :model do
  
  let(:role) {FactoryBot.create :role}
  let(:unit) {FactoryBot.create :unit}
  let!(:employee) {FactoryBot.create :employee, role_id: role.id, unit_id: unit.id}

  let!(:employee_true) {FactoryBot.build :employee, role_id: role.id, unit_id: unit.id}
  let!(:employee_fail) {FactoryBot.build :employee, role_id: nil}

  describe "Associations" do
    it "should belongs to role" do
      is_expected.to belong_to(:role)
    end

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

    context "validates email uniqueness" do
      it "should uniqueness email" do
        subject { FactoryBot.create :employee, role_id: role.id, unit_id: unit.id }
        should validate_uniqueness_of(:email)
      end
    end

    context "validates password" do
      it "should has secure password" do
        should have_secure_password
      end
      it "should has secure password" do
        should validate_length_of(:password)
      end
    end
  end
end
