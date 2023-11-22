class Boat < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
  validates :location, :name, presence: true
  validates :capacity, presence: true, numericality: { only_integer: true }
  validates :price, presence: true, numericality: { only_float: true }
end
