class Donation < ApplicationRecord
  belongs_to :campaign
  belongs_to :donor

  validates :amount, numericality: { greater_than: 0.00 }
end
