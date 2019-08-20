class API < Sinatra::Base
  def initialize
    @ledger = Ledger.new
    super()
  end

  result = @ledger.record({ 'some' => 'data' })
  result.success?
  result.expense_id
  result.error_message
end

app = API.new