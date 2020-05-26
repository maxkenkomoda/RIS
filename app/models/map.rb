class Map < ApplicationRecord
  belongs_to :user
  has_one :title  
  accepts_nested_attributes_for :title, allow_destroy: true

  validates :latitude, presence: true
  validates :longitude, presence: true
end
