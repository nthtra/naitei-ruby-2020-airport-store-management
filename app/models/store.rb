class Store < ApplicationRecord
  belongs_to :slot
  belongs_to :user
  belongs_to :category

  delegate :name, to: :slot, prefix: :slot
  delegate :terminal_name, :terminal_id, to: :slot
  delegate :name, to: :user, prefix: :user
end
