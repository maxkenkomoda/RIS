class Map < ApplicationRecord
  belongs_to :user
  has_one :traffic
  
  accepts_nested_attributes_for :traffic

  validates :title, presence: true, length: { maximum: 255 }
  validates :latitude, presence: true
  validates :longitude, presence: true
end
