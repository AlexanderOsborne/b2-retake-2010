class Flight < ApplicationRecord
  validates_presence_of :number,
                        :date,
                        :departure_city,
                        :arrival_city,
                        :airline_id
  belongs_to :airline
  has_many :flight_passengers,dependent: :destroy
  has_many :passengers, through: :flight_passengers
end
