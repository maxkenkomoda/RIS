class Traffic < ApplicationRecord
  belongs_to :map

  validates :volume, inclusion: {in: [true, false]}
  validates :speed, inclusion: {in: [true, false]}
  validates :large_car, inclusion: {in: [true, false]}
  validates :people, inclusion: {in: [true, false]}
  validates :stop,  inclusion: {in: [true, false]}
end
