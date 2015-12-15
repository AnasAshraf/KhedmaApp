OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '415780475277441', '9e801afa76fd224554a534df498274ab', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end