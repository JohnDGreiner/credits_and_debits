require 'test_helper'

class TransactionTest < ActiveSupport::TestCase

  test "the balance" do
    assert_equal 50.60, Transaction.balance.to_f
  end

  test "count of rows in Transactions" do
    assert_equal 7, Transaction.count_transactions
  end

  test "amount spent in current month" do
    assert_equal 90.90, Transaction.curr_month_spent.to_f
  end

  test "amount spent in previous month" do
    assert_equal 20.00, Transaction.prev_month_spent.to_f
  end

  test "number of transactions in current month" do
    assert_equal 3, Transaction.curr_month_trans_count
  end

  test "number of transactions in previous month" do
    assert_equal 2, Transaction.prev_month_trans_count
  end

  test "current month largest expense" do
    assert_equal 90.90, Transaction.curr_month_largest_expense.to_f
  end

  test "largest expense" do
    assert_equal 90.90, Transaction.largest_expense.to_f
  end

  test "most expensive organization" do
    assert_equal "bills", Transaction.most_expensive_organization
  end

end
