class Campaign < ApplicationRecord
  has_many :donations
  has_many :donors, through: :donations
  has_many :matches

  def total_donations
    donations.map { |donation| donation.amount || 0 }.sum
  end
end
