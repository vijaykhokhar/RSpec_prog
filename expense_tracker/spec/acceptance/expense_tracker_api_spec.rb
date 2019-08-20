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
      pending 'need to persist expenses'
      def post_expense(expense)
        post '/expense', JSON.generate(expense)
        expect(last_response.status).to eq(200)

        parsed = JSON.parse(last_response.body) 
        expect(parsed).to include('expense_id' => a_kind_of(Integer))
        expense.merge('id' => parsed['expense_id'])
      end

      coffee = post_expense(
        'payee' => "starbucks",
        'amount' => 5.75,
        'date' => '19-08-2019'
      )

      zoo = post_expense(
        'payee' => 'zoo',
        'amount' => 15.25,
        'date' => '19-08-2019'
        )

      groceries = post_expense(
        'payee' => 'Whole Food',
        'amount' => 100.00,
        'date' => '02-08-2019'
        )

      get '/expenses/19-08-2019'
      expect(last_response.status).to eq(200)
      expenses = JSON.parse(last_response.body)
      expect(expenses).to contain_exactly(coffee, zoo)
    end
  end
end