class Booking < ApplicationRecord
  belongs_to :user
  # belongs_to :availability

  validates_comparison_of :end_date, greater_than: :start_date
end
