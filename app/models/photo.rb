class Photo < ApplicationRecord
  has_many_attached :images
  # has_attached_file :image,
    # hash_secret: "623d866e803958428683c9c7a9cb4cadcb1037ac513eaeccd4",
    # :storage => :cloudinary,
    # :path => 'photo-app/:filename',
    # :cloudinary_credentials => Rails.root.join("config/cloudinary.yml"),
    # styles: { medium: "300x300>"}

  # validates_attachment_content_type :image, content_type: { content_type: /\Aimage\/.*\z/ }
  # validates_attachment_file_name :image, matches: [/png\Z/, /jpe?g\Z/, /gif\Z/]
end