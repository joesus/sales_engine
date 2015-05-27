require_relative 'repository'

class CustomerRepository < Repository
  attr_accessor :resources

  def find_by_last_name(name)
    resources.find { |resource| resource.last_name == name }
  end

  def find_all_by_first_name(name)
    resources.select { |resource| resource.first_name == name }
  end
end