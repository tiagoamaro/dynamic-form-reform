class ZoneMember < ApplicationRecord
  belongs_to :zone
  belongs_to :country
end
