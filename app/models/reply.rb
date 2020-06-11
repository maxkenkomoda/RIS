class Reply < ApplicationRecord
  belongs_to :user
  belongs_to :map

  validates :reply, presence: true, length: { maximum: 225 }

end
