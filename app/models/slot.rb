class Slot < ApplicationRecord
  belongs_to :terminal
  has_many :stores, dependent: :destroy

  delegate :name, :id, to: :terminal, prefix: :terminal
end
