Cloudinary.config_from_url(Rails.application.credentials.cloudinary_url)
Cloudinary.config do |config|
  config.secure = true
end
