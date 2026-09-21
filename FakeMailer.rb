# A simple mock object for testing
class FakeMailer
  attr_reader :last_total_sent

  def initialize(email)
    @email = email
  end

  def send_confirmation(total)
    @last_total_sent = total
  end
end

# --- Test Execution ---
items = [{ name: "Book", price: 15 }, { name: "Pen", price: 5 }]

# 2. Inject the fake mailer class during testing
order = Order.new(items, "test@example.com", mailer_klass: FakeMailer)
order.send_confirmation_email

# 3. Assert the behavior
puts "Test Passed!" if order.mailer.last_total_sent == 20
