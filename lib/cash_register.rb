
class CashRegister

  attr_accessor :total, :last

  def initialize(*employee_discount)
    @total = 0
    @employee_discount = employee_discount
    @items = []
  end

  def discount
    @employee_discount[0]
  end

  #here I was trying to access quantity by using the quantity[0]
  #syntax but for some reason it was not working, I am not sure why
  #I tried the join method, and it did work, so I went forward from
  #there
  def add_item(item, price, *quantity)
    q = quantity.join("").to_i
    if q > 1
      q.times do
      @items.push(item)
      end
    else
      @items.push(item)
    end
    if q > 1
    price_with_quantity = q * price
    @last = price_with_quantity
    @total += price_with_quantity
    else
    @last = price
    @total += price
    end

  end

  def apply_discount
    if discount == nil
      return "There is no discount to apply."
    end
    discount = @employee_discount.join("").to_i
    discount_float = discount.to_f/100.00
    @total = (@total * (1 - discount_float)).to_i
    return "After the discount, the total comes to $#{@total}."
  end

  def items
    @items
  end

  def void_last_transaction
  @total = @total - @last
  end

end
