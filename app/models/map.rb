class Map < ApplicationRecord
  validates :content, presence: true, length: { maximum: 255 }
  validates :latitude, presence: true
  validates :longitude, presence: true
end


