class SlideImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :dropbox

  def store_dir
    "uploads-#{Rails.env}/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :big do
    process resize_to_fill: [1024, 768]
  end

  def extension_white_list
    %w(gif jpg jpeg png)
  end
end
