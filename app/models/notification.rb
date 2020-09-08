class Notification < ApplicationRecord
  belongs_to :receiver, polymorphic: true
  belongs_to :sender, polymorphic: true
  belongs_to :contract

  validates :sender_id, :receiver_id, :sender_type,
            :receiver_type, presence: true, allow_nil: true
  scope :unread_noti, ->{where(read: false)}
  scope :user_receive_noti, ->(user_id, receiver_type){where(receiver_id: user_id, receiver_type: receiver_type)}
  scope :noti_order_by_created_at_desc, ->{order created_at: :desc}
end
