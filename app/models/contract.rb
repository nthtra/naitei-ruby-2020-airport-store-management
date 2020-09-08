class Contract < ApplicationRecord
  belongs_to :store
  belongs_to :status
  has_many :notifications, dependent: :destroy
  delegate :name, to: :status, prefix: :status
  delegate :name, :description, to: :store, prefix: :store
  delegate :name, :user_name, :user_email, :user_company_name,
           :user_identity_number, :user_phone_number,
           :slot_area, :slot_price, :slot_name,
           :category_name, :terminal_name, :terminal_id, to: :store
  scope :by_status_and_datetime, ->{order(status_id: :asc, created_at: :desc)}
end
