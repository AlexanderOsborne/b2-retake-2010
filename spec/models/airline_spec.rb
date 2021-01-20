require 'rails_helper'

RSpec.describe Airline, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :flights}
  end

  describe 'instance methods' do
    it 'Selects distinct passenger names' do
    @airline = Airline.create!(name: "Southwest")
    @flight1 = Flight.create!(number: "711", date:"1/22/21", departure_city: "Denver", arrival_city: "Washington", airline_id: @airline.id)
    @flight2 = Flight.create!(number: "913", date:"1/22/21", departure_city: "Denver", arrival_city: "Seattle", airline_id: @airline.id)
    @passenger1 = Passenger.create!(name: "John Smith", age: 21)
    @passenger2 = Passenger.create!(name: "John Doe", age: 42)
    @passenger3 = Passenger.create!(name: "Doe Rayme", age: 27)
    @passenger4 = Passenger.create!(name: "Sunshine McGee", age: 71)
    @flightpassenger1 = FlightPassenger.create!(flight_id: @flight1.id, passenger_id: @passenger1.id)
    @flightpassenger2 = FlightPassenger.create!(flight_id: @flight1.id, passenger_id: @passenger2.id)
    @flightpassenger3 = FlightPassenger.create!(flight_id: @flight2.id, passenger_id: @passenger3.id)
    @flightpassenger4 = FlightPassenger.create!(flight_id: @flight2.id, passenger_id: @passenger4.id)
    @flightpassenger5 = FlightPassenger.create!(flight_id: @flight1.id, passenger_id: @passenger4.id)

    expect(@airline.find_passengers).to eq([@passenger3.name, @passenger2.name, @passenger1.name, @passenger4.name])
    end
  end
end
