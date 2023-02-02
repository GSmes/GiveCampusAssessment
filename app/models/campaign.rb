class Campaign < ApplicationRecord
  has_many :donations
  has_many :donors, through: :donations
  has_many :matches
end
