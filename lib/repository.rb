class Repository

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