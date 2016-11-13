class Zone < ApplicationRecord
  has_many :zone_members
  has_many :countries, through: :zone_members
end
