Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, "1563145513965132", "5c27dbed6308e0dbf1b0b5adc234fd58"
  provider :google_oauth2, ENV["GOOGLE_CLIENT_ID"], ENV["GOOGLE_CLIENT_SECRET"], {
    name: :google
  }
end
