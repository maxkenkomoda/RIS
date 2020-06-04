class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :maps
  has_many :favorites
  has_many :likes, through: :favorites, source: :map

  def likes?(other_map)
    self.likes.include?(other_map)
  end
end
