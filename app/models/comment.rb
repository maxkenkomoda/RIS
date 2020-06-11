class Comment < ApplicationRecord
  belongs_to :map

  validates :comment, length: { maximum: 800 }
  
end
