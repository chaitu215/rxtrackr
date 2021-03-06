class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_many :medications, dependent: :destroy
  has_many :notes,       through:   :medications
  has_many :identities,  dependent: :destroy
  has_many :allergies,   dependent: :destroy, through: :user_allergies
  has_many :user_allergies
  has_many :provider_profiles, through: :medications

  validates :first_name, presence: true, length: { maximum: 40 }
  validates :email,      presence: true, uniqueness: true
  validates :password,   presence: true, length: { minimum: 8 }, allow_nil: true

  enum role: [:normal, :admin]

  after_initialize :set_default_role

  def allergies_attributes=(allergies_attributes)
    allergies_attributes.values.each do |attribute|
      if attribute[:name].present?
        allergy = Allergy.find_or_create_by(attribute)
        if !self.user_allergies.include?(attribute[:name])
          self.user_allergies.build(allergy_id: allergy.id)
        end
      end
    end
  end

  private

    def set_default_role
      self.role ||= :user
    end
end
