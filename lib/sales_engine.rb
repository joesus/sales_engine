require 'pry'
require 'csv'
require_relative 'merchant_repository'
require_relative 'customer_repository'
require_relative 'invoice_item_repository'
require_relative 'invoice_repository'
require_relative 'item_repository'
require_relative 'transaction_repository'

class SalesEngine
  attr_accessor :merchant_repository, :customer_repository, :invoice_repository, :invoice_item_repository,
                :item_repository, :transaction_repository

  def initialize(files)
    Dir.glob(files + "/*.csv") do |file|
      base_name = File.basename(file,File.extname(file)).chop
      attr = "#{base_name}_repository"
      repository = eval("#{format_repo_name(base_name)}Repository.new('#{file}')")
      self.__send__("#{attr}=", repository)
    end
    self.merchant_repository = files
  end

  def startup

  end

  def format_repo_name(base_name)
    base_name.split("_").each { |string| string.capitalize! }.join
  end
end