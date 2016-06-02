class Transaction
  attr_reader :id, :product,:customer, :transaction
  @@id=1
  @@transaction=[]

  def initialize(customer, product)
    @customer = customer
    @product = product
    @id = @@id
    @@id+=1

    add_transaction
  end

  def self.all
    @@transaction
  end

  def self.find(index)
    @@transaction[index-1]

  end

  def add_transaction

    val = is_product_out_of_stock?
    if val
      raise OutOfStockError,"#{@product} is out of stock."
    end
    @product.stock =@product.stock-1
    @@transaction<<self
  end

  def is_product_out_of_stock?

    @product.stock==0

  end

end



