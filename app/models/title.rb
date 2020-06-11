class Title < ApplicationRecord
  belongs_to :map
  
  validates :title, presence: true, length: { maximum: 25 }

end
