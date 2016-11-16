class Medication < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validate  :brand_or_generic

  default_scope -> { order(created_at: :desc) }

  private

    def brand_or_generic
      if self.brand_name.nil? && self.generic_name.nil?
        errors.add(:brand_or_generic, "must have either a brand or generic name")
      end
    end
end
