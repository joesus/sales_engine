class Customer
  attr_accessor :id, :first_name, :last_name, :created_at, :updated_at

  def initialize(customer)
    self.id = customer[0].to_i
    self.first_name = customer[1]
    self.last_name = customer[2]
    self.created_at = customer[3]
    self.updated_at = customer[4]
  end
end