require 'csv'
require 'awesome_print'


class Customer
  attr_accessor :email, :address
  attr_reader :id

  # or address could be {:name, :address}
  def initialize(id, email, address)
    @id = id
    @email = email
    @address = address
  end

  def self.all
    total_data = CSV.open("data/customers.csv", 'r').map do |line|
      Customer.new(line[0].to_i, line[1], {street: line[2],city:
        line[3],state: line[4],zip: line[5]})
    end

    return total_data
    # @@instances.inspect
  end
 # params integer
 # returns instance of Customer
  def self.find(id)
    self.all.find { |x| x.id == id }
  end


end
