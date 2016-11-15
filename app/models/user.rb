class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable,
         :omniauthable

  has_many :medications, dependent: :destroy
  has_many :doctors,     through: :medications
  has_many :doses,       through: :medications

  before_save   :downcase_email

  validates :first_name, presence: true
  validates :email,      presence: true, uniqueness: true
  validates :password,   presence: true, length: { minimum: 6 }, allow_nil: true

  enum role: [:normal, :admin]

  after_initialize :set_default_role

  private

    def set_default_role
      self.role ||= :user
    end

    def downcase_email
      email.downcase!
    end
end
