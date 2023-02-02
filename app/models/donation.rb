class Donation < ApplicationRecord
  belongs_to :campaign
  belongs_to :donor

  validates :amount, numericality: { greater_than: 0.00 }

  after_commit :trigger_matching_donations

  private

  def trigger_matching_donations
    return if match
    # NOTE: Pull below logic into background job that kicks off matching donations async
    #       and pull actual matching logic into a service.
    matches = campaign.matches.active.where("donor_id != '#{donor_id}'")
    return unless matches.any?

    matches.each do |match|
      if match.dollar_match?
        create_dollar_match(match)
      else
        create_donor_match(match)
      end
    end
  end

  def create_dollar_match(match)
    total_potential_match = match.amount * amount
    match_donation_amount = total_potential_match > match.remaining_balance ?
                              match.remaining_balance :
                              total_potential_match

    campaign.donations.create(
      amount: match_donation_amount,
      donor: match.donor,
      match: true
    )

    new_remaining_balance = match.remaining_balance - match_donation_amount
    match.update(remaining_balance: new_remaining_balance)
  end

  def create_donor_match(match)
    return unless new_campaign_donor?

    campaign.donations.create(
      amount: match.amount,
      donor: match.donor,
      match: true
    )

    new_remaining_balance = match.remaining_balance - 1
    match.update(remaining_balance: new_remaining_balance)
  end

  def new_campaign_donor?
    campaign.donations.where(donor_id: donor.id).count <= 1
  end
end
