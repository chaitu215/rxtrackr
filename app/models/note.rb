class Note < ApplicationRecord
  belongs_to :medication

  default_scope -> { order(created_at: :desc) }

  validates :medication_id, presence: true
  validates :content, presence: true
end
