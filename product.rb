require_relative "receipt.rb"

IMPORT_SALES_CONSTANT = 0.15
SALES_TAX_CONSTANT = 0.1

class Product
  attr_accessor :item_name, :price, :exempt, :imported, :tax

  def initialize(item_name, price, exempt, imported)
    @item_name = item_name
    @price = price.to_i
    @exempt = exempt
    @imported = imported
    @tax = 0
  end

  def calculate_tax
    if !@exempt && @imported
      @tax = @price * IMPORT_SALES_CONSTANT
    elsif !@exempt && !@imported
      @tax = @price * SALES_TAX_CONSTANT
    elsif @exempt && !@imported
      @tax = 0
    end
  end
end
prod1 = Product.new('Chocolates', 120, true, true)
prod2 = Product.new('Potato Chips', 100, true, false)
prod3 = Product.new('Perfume', 150, false, true)
receipt = Receipt.new
receipt.add_product(prod1)
receipt.add_product(prod2)
receipt.add_product(prod3)
receipt.display_product
