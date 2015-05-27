require_relative 'repository'
require 'csv'

class TransactionRepository < Repository
  attr_accessor :resources

  def initialize(file)
    super
    convert_ids
  end

  def find_by_id(id)
    resources.find { |transaction| transaction.id == id }
  end

  def find_by_credit_card_number(number)
    resources.find { |transaction| transaction.credit_card_number == number }
  end

  def find_all_by_result(result)
    resources.select { |transaction| transaction.result == result }
  end

  private

  def convert_ids
    resources.map { |resource| resource.id = resource.id.to_i }
  end
end