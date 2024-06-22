# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'], {
#     scope: 'userinfo.email,userinfo.profile',
#     prompt: 'select_account',
#     image_aspect_ratio: 'square',
#     image_size: 50
#   }
# end

# config/initializers/omniauth.rb
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'], {
    scope: 'userinfo.email, userinfo.profile',
    redirect_uri: "https://snippet-app-78766edea1d3.herokuapp.com/auth/google_oauth2/callback"
  }
end
