# app/models/order.rb
class Order
  attr_accessor :items, :mailer, :calculator

  def initialize(items, mailer:, calculator:)
    @items = items
    @mailer = mailer
    @calculator = calculator
  end

  def total
    @calculator.calculate_total(@items)
  end

  def send_confirmation_email
    @mailer.send_confirmation(total)
  end
end
