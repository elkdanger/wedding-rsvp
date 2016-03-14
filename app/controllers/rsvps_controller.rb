class RsvpsController < ApplicationController

  # GET /rsvps
  # GET /rsvps.json
  def index
    @rsvps = Rsvp.all
  end

  # POST /rsvps
  # POST /rsvps.json
  def create
    @rsvp = Rsvp.new(rsvp_params)

    @rsvp.save

    #need to flash some kind of acknowledgement here or redirect to thankyou page
    redirect_to "/"

  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def rsvp_params
      params.require(:rsvp).permit(:name, :email, :phone, :events, :guests, :guestinfo, :message)
    end
end
