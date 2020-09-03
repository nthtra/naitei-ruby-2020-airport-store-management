require "rails_helper"

RSpec.describe Slot, type: :model do

  describe "Associations" do
    it "should belongs to terminal" do
      is_expected.to belong_to(:terminal)
    end

    it "should has many stores" do
      is_expected.to have_many(:stores).dependent(:destroy)
    end
  end

  describe 'Scopes' do
    let!(:slot_one) { FactoryBot.create(:slot, is_empty: true) }
    let!(:slot_two) { FactoryBot.create(:slot, is_empty: true) }
    let!(:slot_three) { FactoryBot.create(:slot, is_empty: false) }
    let!(:slot_four) { FactoryBot.create(:slot, is_empty: true) }

    it 'orders by status and update time' do
      Slot.all.by_status_and_datetime.should eq [slot_three, slot_four, slot_two, slot_one]
    end

    it 'orders by status and update time for user' do
      Slot.all.by_status_and_datetime_for_user.should eq [slot_four, slot_two, slot_one, slot_three]
    end

    it 'orders by created at' do
      Slot.all.order_by_created_at_asc.should eq [slot_one, slot_two, slot_three, slot_four]
    end
  end

  describe "Delegate" do
    it { should delegate_method(:name).to(:terminal).with_prefix }
  end

end