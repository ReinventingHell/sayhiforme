Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['OMNIAUTH_PROVIDER_KEY'], ENV['OMNIAUTH_PROVIDER_SECRET'],
           :scope => "email,publish_stream,friends_photos,friends_birthday"
end