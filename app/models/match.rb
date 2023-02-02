class Match < ApplicationRecord
  enum kind: { dollar: 0, donor: 1 }
  enum state: { active: 0, disabled: 1 }

  belongs_to :campaign
  belongs_to :donor

  validates :amount, numericality: { greater_than: 0.00 }

  after_update :recalculate_state

  scope :active, -> { where(state: 0) }

  def dollar_match?
    kind == 'dollar'
  end

  def donor_match?
    kind == 'donor'
  end

  private

  def recalculate_state
    return if state == :disabled || remaining_balance.positive?

    state = :disabled if remaining_balance.zero?
  end
end
