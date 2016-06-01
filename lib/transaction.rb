class Transaction
  attr_reader :id, :product,:customer, :transaction
  @@id=1
  @@transaction=[]

  def initialize(customer, product)
    @customer = customer
    @product = product
    @id = @@id
    @@id+=1

    @product.stock =@product.stock-1
    add_transaction
  end

  def self.all
    @@transaction
  end

  def add_transaction
    @@transaction<<self
  end

  def self.find(index)
        @@transaction[index-1]

      end

  end