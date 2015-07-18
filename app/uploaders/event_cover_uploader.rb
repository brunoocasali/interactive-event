class EventCoverUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :dropbox

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :normal do
    process resize_to_fill: [800, 600]
  end

  version :thumb do
    process resize_to_fit: [300, 200]
  end

  def extension_white_list
    %w(jpg jpeg png)
  end
end
