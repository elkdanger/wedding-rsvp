require "rails_helper"

RSpec.describe RsvpMailer, type: :mailer do

  describe "the notification mailer" do

    let (:rsvp) { Rsvp.new name: 'Steve' }
    let (:mail) { RsvpMailer.notification rsvp }

    before do
      ENV['RECIPIENTS'] = 'noone@microsoft.com;jim@bob.com'
    end

    it 'sets the correct subject' do
      expect(mail.subject).to eql 'Steve has sent their RSVP!'
    end

    it 'sends it to microsoft' do
      expect(mail.to).to include 'noone@microsoft.com'
    end

    it 'sends it to jimbob' do
      expect(mail.to).to include 'jim@bob.com'
    end

  end

end
