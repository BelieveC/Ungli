OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '140430626410489', 'c2482dab6d4cc0d81625f9aa9529c134', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.crt").to_s}}}
end