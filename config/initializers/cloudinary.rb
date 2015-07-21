Cloudinary.config do |config|
  config.cloud_name = ENV['CLOUDINARY_CLOUD_NAME']
  config.api_key = ENV['CLOUDINARY_API_KEY']
  config.api_secret = ENV['CLOUDINARY_API_SECRET']
  config.enhance_image_tag = ENV['CLOUDINARY_ENHANCE_IMAGE_TAG']
  config.static_image_support = ENV['CLOUDINARY_STATIC_IMAGE_SUPPORT']
end
