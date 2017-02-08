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

# In console:
# => u=User.find_by_id(1)
# => u.allergies.select(:name).map(&:name).uniq.sort
# => Allergy Load (0.1ms)  SELECT "allergies"."name" FROM "allergies" INNER JOIN "user_allergies" ON "allergies"."id" = "user_allergies"."allergy_id" WHERE "user_allergies"."user_id" = ?  [["user_id", 1]]
# => ["codeine", "dust", "hayfever", "soy"]

# => In browser:
# => NoMethodError in UsersController#show
# => undefined method `allergies' for nil:NilClass

  def self.allergy_list
    if !Allergy.nil?
      user = User.find_by_id(:id)
      # below gives all allergies in db, not user's
      allergy_list = Allergy.select(:name).map(&:name).uniq.sort
      if allergy_list.length == 1
        allergy_list
      elsif allergy_list.length == 2
        allergy_list.join(" and ")
      elsif allergy_list.length > 2
        list = allergy_list[0..-2].join(", ")
        list << ", and #{allergy_list.last}"
        list
      end
    end
  end

  private

    def set_default_role
      self.role ||= :user
    end
end
