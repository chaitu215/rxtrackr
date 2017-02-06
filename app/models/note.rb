class Note < ApplicationRecord
  belongs_to :medication, inverse_of: :notes

  default_scope -> { order(created_at: :desc) }

  validates :content, presence: true
end
