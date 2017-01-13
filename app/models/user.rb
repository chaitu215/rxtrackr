class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_many :medications, dependent: :destroy
  has_many :notes,       through: :medications
  has_many :identities

  validates :first_name, presence: true, length: { maximum: 40 }
  validates :email,      presence: true, uniqueness: true
  validates :password,   presence: true, length: { minimum: 6 }, allow_nil: true

  enum role: [:normal, :admin]

  after_initialize :set_default_role

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.password = Devise.friendly_token[0,20]
      user.save
    end
  end

  private

    def set_default_role
      self.role ||= :user
    end
end
