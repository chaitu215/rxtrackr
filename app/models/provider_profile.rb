class ProviderProfile < ApplicationRecord
  belongs_to :medication
  belongs_to :user
  has_many :medications

  accepts_nested_attributes_for :medications, allow_destroy: true,
                                reject_if: proc { |attributes| attributes['brand_name'].blank? }
end
