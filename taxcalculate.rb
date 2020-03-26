require_relative ('C:\Training\print_receipt.rb')

class Product
	attr_accessor :item_name, :price, :exempt, :imported, :tax
  def initialize(item_name, price, exempt, imported)
	@item_name = item_name
	@price = price.to_f
	@exempt = exempt
	@imported = imported
	@tax = 0
  end

  def calculate_tax
  	if @exempt == false && @imported == true
  		@tax = @price * 0.15
    elsif @exempt == false && @imported == false
      @tax = @price * 0.1  
    elsif @exempt == true && @imported == false
    	@tax = 0
    end
  end
end
prod1 = Product.new('Chocolates', 120.00, true, true)
prod2 = Product.new('Potato Chips', 100.00, true, false)
prod3 = Product.new('Perfume', 150.00, false, true)
new_receipt = Receipt.new
new_receipt.add_to_receipt(prod1)
new_receipt.add_to_receipt(prod2)
new_receipt.add_to_receipt(prod3)
puts new_receipt.print_list