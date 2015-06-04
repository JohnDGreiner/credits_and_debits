class Transaction < ActiveRecord::Base

  def self.balance
    balance = 0
    self.all.each do |b|
      balance += (b.is_credit ? b.amount : -1*b.amount)
    end
    balance
  end

  def self.count_transactions
    self.all.count
  end

  def self.curr_month_trans_count
    self.all.select { |m| m.created_at.month == Time.now.month}.count
  end

  def self.prev_month_trans_count
    self.all.select { |m| m.created_at.month == Time.now.month - 1}.count
  end

  def self.curr_month_spent
    spent = 0
    self.all.each do |m|
      if m.created_at.month == Time.now.month && !m.is_credit
        spent += m.amount
      end
    end
    spent
  end

  def self.prev_month_spent
    spent = 0
    self.all.each do |m|
      if m.created_at.month == Time.now.month - 1 && !m.is_credit
        spent += m.amount
      end
    end
    spent
  end

  def self.curr_month_largest_expense
    array = self.all.select { |m| m.created_at.month == Time.now.month && !m.is_credit}
    array = array.sort_by {|a| a.amount}
    array.last.amount
  end

  def self.largest_expense
    array = self.all.select { |m| !m.is_credit}
    array = array.sort_by {|a| a.amount}
    array.last.amount
  end

  def self.most_expensive_organization
    array = self.all.group('organization')
    expensive = array.select { |o| !o.is_credit}
    expensive = expensive.sort_by {|a| a.amount}
    expensive.last.organization
  end

end
