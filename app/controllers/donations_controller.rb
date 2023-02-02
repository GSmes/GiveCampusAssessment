class DonationsController < ApplicationController
  def new
    @campaign = Campaign.find(params[:campaign_id])
    @donation = @campaign.donations.new(donor: Donor.first)
  end

  def create
  end
end
