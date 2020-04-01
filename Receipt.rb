class Receipt
  def initialize
    @list = Array.new
    @price_total = 0
    @tax_total = 0
    @grand_total = 0
  end

  def add_product(item)
    @list << item
    item.calculate_tax
    @price_total += item.price
    @tax_total += item.tax
    @grand_total = @price_total + @tax_total
  end

  def display_product
    @list.each do |product|
      puts "#{product.item_name}, #{product.price}"
    end
    puts "Subtotal: #{@price_total}"
    puts "Tax Total: #{@tax_total}"
    puts "Grand Total: #{@grand_total}"
  end
end
