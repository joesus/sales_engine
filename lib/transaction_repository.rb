require_relative 'transaction'
require 'csv'

class TransactionRepository
  attr_accessor :transactions

  def initialize(file)
    @transactions = []
    CSV.foreach(file) do |row|
      @transactions << Transaction.new(row)
    end
    @transactions.shift
  end

  def inspect
    self.class
  end

  def random
    transactions[rand(transactions.count - 1)]
  end

  def find_by_id(id)
    transactions.find { |transaction| transaction.id == id }
  end

  def find_by_credit_card_number(number)
    transactions.find { |transaction| transaction.credit_card_number == number }
  end

  def find_all_by_result(result)
    transactions.select { |transaction| transaction.result == result }
  end
end