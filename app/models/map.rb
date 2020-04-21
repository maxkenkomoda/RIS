class Map < ApplicationRecord
  geocoded_by :adress
  after_validation :geocode
end

