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


end
