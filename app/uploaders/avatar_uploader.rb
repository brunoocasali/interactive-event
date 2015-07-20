class AvatarUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  version :big_screen do
    cloudinary_transformation effect: 'brightness:30', width: 250, height: 250,
                              quality: 80, crop: :thumb, gravity: :face
  end
end
