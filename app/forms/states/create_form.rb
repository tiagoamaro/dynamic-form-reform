module States
  class CreateForm < Reform::Form
    property :zone_id, virtual: true

    property :country_id
    property :name

    validates :name,
              :country_id,
              presence: true

    def zone_options
      Zone.all.map { |z| [z.name, z.id] }
    end

    def country_options
      ZoneMember.all.map { |zm| [zm.country.name, zm.id] }
    end
  end
end
