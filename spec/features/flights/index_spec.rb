require 'rails_helper'

RSpec.describe 'as a visitor', type: :feature do
  describe 'shen I visit the flighs index page' do
    before(:each) do
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
    end

    it 'I see each flight number listed and its passengers' do
      visit flights_path

      expect(page).to have_content(@flight1.number)
      expect(page).to have_content(@passenger1.name)
      expect(page).to have_content(@passenger2.name)
      expect(page).to have_content(@flight2.number)
      expect(page).to have_content(@passenger3.name) 
      expect(page).to have_content(@passenger4.name) 
    end

    it 'Allows me to remove a passenger from a flight' do
      visit flights_path
      
      first(:link, "Remove Passenger").click
        
      expect(current_path).to eq(flights_path)
      expect(page).to have_no_content(@passenger1.name)
    end
  end
end