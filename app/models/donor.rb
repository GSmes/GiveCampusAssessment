class Donor < ApplicationRecord
  has_many :donations, dependent: :destroy
  has_many :matches, dependent: :destroy

  validates_presence_of :first_name, :last_name, :email
end
