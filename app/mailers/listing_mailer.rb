# app/mailers/listing_mailer.rb
class ListingMailer < ApplicationMailer
  def listing_approved(listing)
    @listing = listing
    @user = listing.user
    mail(to: @user.email, subject: 'Your listing has been approved')
  end
end
