OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '847473012040881', '8490124b982a8c0cf9b5cf3c20c9ace5'
end