class Medication < ApplicationRecord
  belongs_to :user
  has_many   :notes, dependent: :destroy

  validates :user_id, presence: true
  validate  :brand_or_generic

  def check_for_missing_info
    if self.dose.empty?
      need_dose_info
    elsif self.administration_route.empty?
      administration_route_missing
    elsif self.frequency.empty?
      frequency_missing
    elsif self.doctor.empty?
      need_doctor_or_otc
    else
      @message = nil
    end
  end

  def need_dose_info
    "You are missing the dose information. How much of this medicine is taken? Please edit."
  end

  def administration_route_missing
    "How is this medicine taken? For example, is it a pill or liquid? Please edit."
  end

  def frequency_missing
    "How often is this medicine taken? Please edit."
  end

  def need_doctor_or_otc
    "You are missing prescribing doctor information. Is this an over the counter medicine? Please edit."
  end

  def self.most_recent
    Medication.all.order('updated_at DESC').first
  end

  private

    def brand_or_generic
      if self.brand_name.empty? && self.generic_name.empty?
        errors.add(:brand_or_generic, "must have either a brand or generic name")
      end
    end
end
