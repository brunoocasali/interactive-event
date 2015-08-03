class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :dropbox

  def store_dir
    "uploads-#{Rails.env}/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :big_screen do
    process resize_to_fill: [250, 250]
  end

  def extension_white_list
    %w(gif jpg jpeg png)
  end
end
