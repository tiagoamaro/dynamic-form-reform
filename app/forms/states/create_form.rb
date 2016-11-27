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
      scope = ZoneMember
      scope = scope.where(zone_id: self.zone_id) if self.zone_id.present?

      scope.all.map do |zm|
        [zm.country.name, zm.id]
      end
    end

    def prepopulate!(options = {})
      super # Calls form + nested populators

      if options
        self.zone_id    = options[:zone_id]
        self.country_id = options[:country_id]
      end
    end
  end
end
