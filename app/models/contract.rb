class Contract < ApplicationRecord
  belongs_to :store
  belongs_to :status

  delegate :name, to: :status, prefix: :status
  delegate :name, to: :store, prefix: :store
  delegate :name, :user_name, :slot_name,
           :terminal_name, :terminal_id, to: :store

  scope :by_status_and_datetime, ->{order(status_id: :asc, created_at: :desc)}
end
