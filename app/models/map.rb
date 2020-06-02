class Map < ApplicationRecord

  belongs_to :user

  has_one :title, dependent: :destroy  
  has_one :traffic, dependent: :destroy

  accepts_nested_attributes_for :title, allow_destroy: true
  accepts_nested_attributes_for :traffic, allow_destroy: true

  validates :latitude, presence: true
  validates :longitude, presence: true
end
