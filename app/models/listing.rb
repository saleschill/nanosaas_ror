class Listing < ApplicationRecord
  belongs_to :user
  validates :name, :price, :commission, :description, :contact_info, :website_link, presence: true
  validates :price, :commission, numericality: { greater_than_or_equal_to: 0 }
  validates :website_link, format: { with: /\A#{URI::regexp(['http', 'https'])}\z/, message: "must be a valid URL" }
end
