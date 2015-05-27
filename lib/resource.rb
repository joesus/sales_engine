class Resource

  def initialize(headers, row)
    create_attrs(headers)
    headers.each_with_index do |header, index|
      self.send("#{header}=", row[index])
    end
  end

  def create_attrs(array)
    array.each do |item|
      self.class.send(:attr_accessor, item)
    end
  end
end