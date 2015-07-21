class SlideImageUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  version :big do
    process resize_to_fill: [1024, 768]
  end

  version :thumb, from_version: :big do
    process resize_to_fill: [300, 200]
  end
end
