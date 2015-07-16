class AvatarUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  version :big_screen do
    process resize_to_fill: [250, 250]
  end

  version :desktop, from_version: :big_screen do
    process resize_to_fill: [200, 200]
  end

  version :mobile, from_version: :desktop do
    process resize_to_fill: [100, 100]
  end

  version :thumb, from_version: :mobile do
    process resize_to_fill: [50, 50]
  end


  def extension_white_list
    %w(gif jpg jpeg png)
  end
end
