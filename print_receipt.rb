class Receipt

  def initialize
  	@list = []
  end

  def add_to_receipt(item)
  	@list << item
  	item.calculate_tax
  	@price_total += item.price
  	@tax_total += item.tax
  	@grand_total = @price_total + @tax_total
  end

  def print_list
    @list.each do |product|
    	puts '#{product.item_name}, #{product.price}'
    end
    puts 'Subtotal: #{@price_total}'
    puts 'Tax Total: #{@tax_total}'
    puts 'Grand Total: #{@grand_total}'
  end

end
