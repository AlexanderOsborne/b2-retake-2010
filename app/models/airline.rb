class Airline < ApplicationRecord
  validates_presence_of :name
  has_many :flights

  def find_passengers
    Flight.joins(:passengers)
    .select(:passengers)
    .order(:name)
    .distinct
    .pluck(:name)
  end
end
