class Note < ApplicationRecord
  belongs_to :medication, inverse_of: :notes, optional: true
  
  default_scope -> { order(created_at: :desc) }
end
