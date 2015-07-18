class SlideImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :dropbox

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :big_screen do
    process resize_to_fit: [1600, 1200]
  end

  version :big, from_version: :big_screen do
    process resize_to_fill: [1024, 768]
  end

  version :normal, from_version: :big do
    process resize_to_fill: [800, 600]
  end

  version :thumb, from_version: :normal do
    process resize_to_fill: [300, 200]
  end

  def extension_white_list
    %w(jpg jpeg png)
  end
end
