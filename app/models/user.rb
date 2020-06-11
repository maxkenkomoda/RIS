class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :maps, dependent: :destroy
  
  has_many :favorites
  has_many :likes, through: :favorites, source: :map

  has_many :replies, dependent: :destroy

  def likes?(other_map)
    self.likes.include?(other_map)
  end
end
