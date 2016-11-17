class Note < ApplicationRecord
  belongs_to :medication

  validates :medication_id, presence: true
end
