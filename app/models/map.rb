class Map < ApplicationRecord

  belongs_to :user

  has_one :title, dependent: :destroy  
  has_one :traffic, dependent: :destroy
  has_one :road, dependent: :destroy
  has_one :shop, dependent: :destroy
  has_one :comment, dependent: :destroy

  accepts_nested_attributes_for :title, allow_destroy: true
  accepts_nested_attributes_for :traffic, allow_destroy: true
  accepts_nested_attributes_for :road, allow_destroy: true
  accepts_nested_attributes_for :shop, allow_destroy: true
  accepts_nested_attributes_for :comment, allow_destroy: true

  validates :latitude, presence: true
  validates :longitude, presence: true
end
