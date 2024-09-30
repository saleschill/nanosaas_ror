# app/controllers/admin/listings_controller.rb
class Admin::ListingsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin
  before_action :set_listing, only: [:approve, :reject]

  def index
    @listings = Listing.where(approved: false).order(created_at: :desc).page(params[:page])
  end

  def approve
    @listing.update(approved: true)
    redirect_to admin_listings_path, notice: 'Listing approved successfully.'
  end

  def reject
    @listing.destroy
    redirect_to admin_listings_path, notice: 'Listing rejected and removed.'
  end

  private

  def require_admin
    redirect_to root_path, alert: 'Access denied.' unless current_user.admin?
  end

  def set_listing
    @listing = Listing.find(params[:id])
  end
end
