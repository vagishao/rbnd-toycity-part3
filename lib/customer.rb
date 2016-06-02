class Customer
  attr_reader :name
  attr_accessor :transaction

  @@customers=[]


  def initialize(options={})
    @name=options[:name]
    add_customers
  end

  def self.all
    @@customers
  end

  def self.find_by_name(name)
    @@customers.each do |customer|
      if name==customer.name
        return customer
      end
    end

  end

  def purchase(product)

    Transaction.new(self,product)

  end


  private

  def add_customers

    val=is_customer_duplicate?
    if val
      raise DuplicateCustomerError,"#{@name} already exists"
    end
    @@customers<<self
  end

  def is_customer_duplicate?
    @@customers.each do |customer|
      if @name==customer.name
        return true
      end
    end
    return false
  end

  def to_s
    "Customer: #{@name}"
  end
end