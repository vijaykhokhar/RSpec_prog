require 'rack/test'
require 'json'
require_relative '../../app/api.rb'

module ExpenseTracker
  RSpec.describe 'Expense Tracker API' do
    include Rack::Test::Methods

    def app
      ExpenseTracker::API.new
    end

    it 'records submitted expense' do
      coffee = {
        'payee' => "starbucks",
        'amount' => 5.75,
        'date' => '19-08-2019'
      }

      post '/expense', JSON.generate(coffee)
    end
  end
end