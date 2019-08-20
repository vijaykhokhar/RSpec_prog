require_relative '../../../app/api.rb'
require 'rack/test'

module ExpenseTracker

  RSpec.describe API do
    include Rack::Test::Methods

    def app
      API.new(ledger: ledger)
    end

    let(:ledger) { instance_double('ExpenseTracker::Ledger') }

    describe 'POST/expense' do
      context 'when the expense is successfully recorded' do
        let(:expense) { { 'some' => 'daata' } }

        before do
          allow(ledger).to receive(:record).with(expense).and_return(RecordResult.new(true, 417, nil))
        end

        it 'return expense id' do
          post '/expense', JSON.generate(expense)
          parsed = JSON.parse(last_response.body)
          expect(parsed).to include('expense_id' => 417)
        end

        it 'responds with a 200 (OK)' do
          post '/expense', JSON.generate(expense)
          expect(last_response.status).to eq(200)
        end
      end

      context 'when the expense fails validation' do
        let(:expense) { { 'some' => 'daata' } }

        before do
          allow(ledger).to receive(:record).with(expense).and_return(RecordResult.new(false, 417, 'Expense Incomplete'))
        end

        it 'returns errors message' do
          post '/expense', JSON.generate(expense)
          parsed = JSON.parse(last_response.body)
          expect(parsed).to include('error' => 'Expense Incomplete')
        end

        it 'responds with a 422 (unprocessable entity)' do
          post '/expense', JSON.generate(expense)
          expect(last_response.status).to eq(422)
        end
      end
    end
  end
end