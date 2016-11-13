class Country < ApplicationRecord
  has_many :zone_members
  has_many :zones, through: :zone_members
end
