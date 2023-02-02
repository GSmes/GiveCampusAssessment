class DonationsController < ApplicationController
  def new
    @campaign = Campaign.find(params[:campaign_id])
    @donation = @campaign.donations.new(donor: Donor.first)
  end

  def create
    campaign = Campaign.find(params[:campaign_id])

    campaign.donations.new(donation_params)
    campaign.matches.new(match_params) if match_params

    if campaign.save
      redirect_to campaign_path(campaign)
    else
      render :new
    end
  end

  private

  def create_params
    params.require(:donation)
          .permit(:amount, match: [:kind, :amount, :remaining_balance])
  end

  def donation_params
    create_params.except(:match).merge(donor_id: donor_id)
  end

  def match_params
    match_params = create_params.delete(:match)

    return nil unless match_params.has_key?(:kind)

    match_params.merge(donor_id: donor_id)
  end

  def donor_id
    # NOTE: Would normally use current authed user, but since I've skipped auth/login,
    #       I'm simply setting the donor to the first donor who hasn't made a donation yet.
    donor = Donor.left_joins(:donations).where(donations: {id: nil}).first

    donor.present? ? donor.id : FactoryBot.create(:donor).id
  end
end
