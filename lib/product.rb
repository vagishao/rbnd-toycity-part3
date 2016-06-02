class Product

  attr_reader :title, :price
  attr_accessor :stock


  @@products=[]

  def initialize(options={})

    @title=options[:title]
    @price=options[:price]
    @stock=options[:stock]
    add_to_products

  end

  def self.all

    @@products
  end


  def self.find_by_title(title)
    @@products.each do |product|
      if  title==product.title
        return product
      end
    end
  end

  def in_stock?
    @stock>0
  end

  def self.in_stock
    products_in_stock=[]
    @@products.each do |product|
      if product.in_stock?
        products_in_stock<<product
      end
    end
    return products_in_stock
  end


  def to_s
    "Product: #{@title}"
  end

  def self.clear_stock_of_product(product_name)
    product=find_by_title(product_name)
    product.stock=0
    puts "Cleared stock of #{product_name}"
  end
  private

  def add_to_products


    val = is_product_duplicate?
    if val
      raise DuplicateProductError,"#{@title} already exists"
    end
    @@products<<self
  end

  def is_product_duplicate?

    @@products.each do |product|
      if  @title==product.title
        return true
      end
    end

    return false
  end

end

