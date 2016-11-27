module States
  class CreateForm < Reform::Form
    property :zone_id, virtual: true

    property :country_id, prepopulator: :country_options
    property :name

    validates :name,
              :country_id,
              presence: true

    def zone_options
      Zone.all.map { |z| [z.name, z.id] }
    end

    def country_options(options = {})
      ZoneMember.all.map { |zm| [zm.country.name, zm.id] }
    end
  end
end
