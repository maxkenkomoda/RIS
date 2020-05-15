class Map < ApplicationRecord
  validates :title, presence: true, length: { maximum: 255 }
  validates :latitude, presence: true
  validates :longitude, presence: true
end
