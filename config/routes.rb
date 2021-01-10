Spree::Core::Engine.add_routes do
  post '/webhooks/:id', to: 'webhooks#receive', as: :receive_webhook
end
