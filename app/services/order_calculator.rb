# app/services/order_calculator.rb
class OrderCalculator
  def initialize(tax_rate: 0.10)
    @tax_rate = tax_rate
  end

  def calculate_total(items)
    subtotal = items.sum { |item| item[:price] }
    subtotal + (subtotal * @tax_rate)
  end
end
