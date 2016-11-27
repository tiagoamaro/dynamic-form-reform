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
      scope = ZoneMember.includes(:country).where(zone_id: self.zone_id)
      scope.all.map do |zm|
        [zm.country.name, zm.id]
      end
    end

    def prepopulate!(options = {})
      super # Calls form + nested prepopulators

      if options
        self.zone_id    = options[:zone_id]
        self.country_id = options[:country_id]
      else
        self.zone_id    = default_zone.id
        self.country_id = default_country.id
      end
    end

    private

    def default_zone
      Zone.first
    end

    def default_country
      default_zone.countries.first
    end
  end
end
