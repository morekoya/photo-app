class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :photos
  include PgSearch
  pg_search_scope :search_by_email, against: [:email],
    using: {
      tsearch: {
        prefix: true
      }
    }
end
