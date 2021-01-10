module SpreeWebhooks
  class Engine < Rails::Engine
    require "spree/core"
    isolate_namespace Spree
    engine_name "spree_webhooks"

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    initializer "spree_webhooks.environment", before: :load_config_initializers do |_app|
      SpreeWebhooks::Config = SpreeWebhooks::Configuration.new
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), "../../app/**/*_decorator*.rb")).sort.each do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.to_prepare(&method(:activate).to_proc)
  end
end
