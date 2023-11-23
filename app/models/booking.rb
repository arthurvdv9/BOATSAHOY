class Booking < ApplicationRecord
  validates :status, inclusion: { in: %w(accepted pending rejected) }
  belongs_to :user
  belongs_to :boat

  def total_price
    ActiveSupport::NumberHelper.number_to_currency(((end_date - start_date).to_i * boat.price), unit: "€", precision: 2)
  end


end
