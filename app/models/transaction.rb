class Transaction < ActiveRecord::Base

  def self.balance
    balance = 0
    self.all.each do |b|
      balance += (b.is_credit ? b.amount : -1*b.amount)
    end
    balance
  end

end
