Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :facebook, ENV['OAUTH_CLIENT_ID'], ENV['OAUTH_CLIENT_SECRET']#, {:client_options => {:ssl => {:ca_path => "/etc/ssl/certs"}}}
end
 