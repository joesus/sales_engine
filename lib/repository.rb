require_relative 'resource'

class Repository

  def initialize(file)
    headers = CSV.read(file, headers: true).headers

    @resources = []
    CSV.foreach(file) do |row|
      @resources << Resource.new(headers, row)
    end
    @resources.shift
  end

  def find_by_id(id)
    resources.find { |resource| resource.id == id }
  end

  def random
    resources[rand(resources.count - 1)]
  end

  def inspect
    self.class
  end
end