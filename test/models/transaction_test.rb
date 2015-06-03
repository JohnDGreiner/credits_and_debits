require 'test_helper'

class TransactionTest < ActiveSupport::TestCase

  test "the balance" do
    assert_equal 50.60, Transaction.balance.to_f
  end

end
