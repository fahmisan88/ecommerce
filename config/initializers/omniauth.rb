OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :facebook, ENV['FACEBOOK_KEY'], ENV['FACEBOOK_SECRET'],
  provider :facebook, '180540239036352', 'cccf8ccf2d134bdc69160b154f27e465',
           :scope => 'public_profile, email',
           :info_fields => 'email'
end
