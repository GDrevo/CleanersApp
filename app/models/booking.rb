class Booking < ApplicationRecord
  belongs_to :user
  # belongs_to :cleaner

  validates_comparison_of :end_date, greater_than: :start_date
end
