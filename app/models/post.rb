class Post < ApplicationRecord
  belongs_to :user
  #has_one :map
  
  accepts_nested_attributes_for :map, allow_destroy: true
  
  validates :title, presence: true, length: { maximum: 25 }
end
