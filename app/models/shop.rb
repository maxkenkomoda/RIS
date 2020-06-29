class Shop < ApplicationRecord
  belongs_to :map

  validates :no_shop, inclusion: {in: [true, false]}
  validates :no_vending_machine, inclusion: {in: [true, false]}
end
