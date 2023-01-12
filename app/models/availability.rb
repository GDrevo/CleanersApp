class Availability < ApplicationRecord
  belongs_to :cleaner

  validates_comparison_of :end_time, greater_than: :start_time
end
