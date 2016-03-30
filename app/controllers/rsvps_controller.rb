class RsvpsController < ApplicationController

  # GET /rsvps
  # GET /rsvps.json
  def index
    if session[:logged_in].nil?
      redirect_to '/login'
      return
    end

    @rsvps = Rsvp.order(:name)

    @all_day = @rsvps.select {|x| x.events == "Daytime and Evening" }
    @night_only = @rsvps.select {|x| x.events == "Evening Only" }
    @not_coming = @rsvps.select { |x| x.events == "Sorry, can't make it" }

    @guests = @rsvps.map { |x| x.guests }.select { |x| x != nil? }.reduce(:+)
    @total = @rsvps.count + @guests - @not_coming.count

  end

  # POST /rsvps
  # POST /rsvps.json
  def create
    @rsvp = Rsvp.new(rsvp_params)
    if @rsvp.save
      RsvpMailer.notification(@rsvp).deliver_later
      flash[:success] = "We have received your RSVP - thank you!"
    else
      flash[:warning] = "There was a problem with your RSVP, please try again"
    end
    redirect_to "/"
  end

  private

    def rsvp_params
      params.require(:rsvp).permit(:name, :email, :phone, :events, :guests, :guestinfo, :message)
    end
end
