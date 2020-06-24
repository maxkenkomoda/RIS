class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :maps, dependent: :destroy
  
  has_many :favorites, dependent: :destroy
  has_many :likes, through: :favorites, source: :map
  has_many :bookmarks, dependent: :destroy
  has_many :reverse_of_bookmarks, through: :bookmarks, source: :map

  has_many :replies, dependent: :destroy

# check whether users arleady liked or not
  def likes?(other_map)
    self.likes.include?(other_map)
  end

# check whether users already bookmarked or not
  def reverse_of_bookmarks?(other_map)
    self.reverse_of_bookmarks.include?(other_map)
  end
end
