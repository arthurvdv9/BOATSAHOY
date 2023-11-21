class Booking < ApplicationRecord
  validates :status, inclusion: { in: %w(accepted pending rejected) }
  belongs_to :user
  belongs_to :boat


end
