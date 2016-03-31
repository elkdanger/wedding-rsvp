class RsvpMailer < ApplicationMailer

  def notification(rsvp)

    @rsvp = rsvp

    recipients = ENV['RECIPIENTS'].split ';'

    mail to: recipients, subject: "#{rsvp.name} has sent their RSVP!"
  end

end
