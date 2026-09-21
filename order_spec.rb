# order_spec.rb
require 'rspec'

RSpec.describe Order do
  let(:items) { [{ name: "Book", price: 15 }, { name: "Pen", price: 5 }] }
  let(:email) { "test@example.com" }
  
  # Create a double for the mailer instance
  let(:mock_mailer_instance) { instance_double(OrderMailer) }
  
  # Create a double for the mailer class that returns the instance double on .new
  let(:mock_mailer_class) do
    double("OrderMailerClass", new: mock_mailer_instance)
  end

  subject(:order) { Order.new(items, email, mailer_klass: mock_mailer_class) }

  describe "#send_confirmation_email" do
    it "instantiates the mailer class and calls send_confirmation" do
      # Expect the instance double to receive the method with the correct total
      expect(mock_mailer_instance).to receive(:send_confirmation).with(20)

      order.send_confirmation_email
    end
  end
end
