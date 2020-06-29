class Road < ApplicationRecord
  belongs_to :map

  validates :condition, inclusion: {in: [true, false]}
  validates :sidewalk, inclusion: {in: [true, false]}
  validates :narrow, inclusion: {in: [true, false]}

end
