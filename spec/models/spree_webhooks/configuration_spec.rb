require "spec_helper"

RSpec.describe SpreeWebhooks::Configuration do
  describe "#register_webhook_handler" do
    it "only accepts callable" do
      expect { subject.register_webhook_handler(:foo, Object.new) }.to raise_error(SpreeWebhooks::InvalidHandler)
      expect { subject.register_webhook_handler(:bar, proc {}) }.not_to raise_error
    end
  end
end
