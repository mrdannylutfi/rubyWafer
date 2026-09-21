class OrderMailer
  def initialize(email)
    @email = email
  end

  def send_confirmation(total)
    puts "Sending email to #{@email} for total $#{total}"
  end
end

class Order
  attr_accessor :items, :mailer

  def initialize(items, customer_email)
    @items = items
    @mailer = OrderMailer.new(customer_email)
  end

  def total
    @items.sum { |item| item[:price] }
  end

  def send_confirmation_email
    @mailer.send_confirmation(total)
  end
end
