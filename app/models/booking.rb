class Booking < ApplicationRecord
  validates :start_date, presence: true
  validates :status, inclusion: { in: %w(accepted pending rejected) }
  validates :end_date, presence: true
  belongs_to :user
  belongs_to :boat

def total_price
  if end_date.present? && start_date.present? && boat&.price
    days = (end_date - start_date).to_i + 1
    price = days * boat.price
    ActiveSupport::NumberHelper.number_to_currency(price, unit: "€", precision: 2)
  else
    'Not selected yet!'
  end
end

def total_days
  if end_date.present? && start_date.present?
    (end_date - start_date).to_i + 1
  else
    'Not selected yet!'
  end
end

end
