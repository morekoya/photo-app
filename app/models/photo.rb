class Photo < ApplicationRecord
  has_attached_file :image,
    hash_secret: "623d866e803958428683c9c7a9cb4cadcb1037ac513eaeccd4"
  validates_attachment_content_type :image, 
    content_type: { content_type: /\Aimage\/.*\z/ }
  validates_attachment_file_name :image, matches: [/png\Z/, /jpe?g\Z/]
end