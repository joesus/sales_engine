require_relative 'repository'
require_relative 'customer'

class CustomerRepository < Repository
  attr_accessor :resources

  def initialize(file)
    @resources = []
    CSV.foreach(file) do |row|
      @resources << Customer.new(row)
    end
    @resources.shift
  end

  def inspect
    self.class
  end

  def find_by_last_name(name)
    resources.find { |resource| resource.last_name == name }
  end

  def find_all_by_first_name(name)
    resources.select { |resource| resource.first_name == name }
  end

  
end