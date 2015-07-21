class EventCoverUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  version :normal do
    process resize_to_fill: [800, 600, :fill]
  end

  version :thumb do
    process resize_to_fit: [300, 200, :fit]
  end
end
