class Transaction
  attr_accessor :id, :invoice_id, :credit_card_number, :credit_cared_expiration_date, :result, :created_at, :updated_at

  def initialize(transaction)
    self.id = transaction[0].to_i
    self.invoice_id = transaction[1]
    self.credit_card_number = transaction[2]
    self.credit_cared_expiration_date = transaction[3]
    self.result = transaction[4]
    self.created_at = transaction[5]
    self.updated_at = transaction[6]
  end

  def invoice

  end
end