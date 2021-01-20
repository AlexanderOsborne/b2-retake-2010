require 'rails_helper'

RSpec.describe Airline, type: :model do
  describe 'validations' do
    it { should validate_presence_of :name}
  end

  describe 'relationships' do
    it {should have_many :flights}
  end

  describe 'instance methods' do
  end
end
