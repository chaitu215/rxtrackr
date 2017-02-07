class Allergy < ApplicationRecord
  has_many :users, through: :user_allergies
end
