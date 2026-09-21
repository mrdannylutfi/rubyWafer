class Order
  attr_accessor :items, :customer_email

  def initialize(items, customer_email)
    @items = items
    @customer_email = customer_email
  end

  def total
    @items.sum { |item| item[:price] }
  end

  def send_confirmation_email
    # Code to connect to email server and send message to @customer_email
    puts "Sending email to #{@customer_email} for total $#{total}"
  end
end
