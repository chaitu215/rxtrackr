class ProviderProfile < ApplicationRecord
  belongs_to :medication
  belongs_to :user
  has_many :medications

  accepts_nested_attributes_for :medications, allow_destroy: true

  validate :prescriber_or_otc

  private

    def prescriber_or_otc
      if self.name.empty?
        errors.add(:prescriber_or_otc, "may not be blank")
      end
    end
end
