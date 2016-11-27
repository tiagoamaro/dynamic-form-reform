module Cities
  class CreateForm < Reform::Form
    property :zone_id, virtual: true
    property :country_id, virtual: true

    property :state_id
    property :name

    validates :name,
              :country_id,
              presence: true

    def zone_options
      Zone.all.map { |z| [z.name, z.id] }
    end

    def country_options
      scope = ZoneMember.where(zone_id: self.zone_id)
      scope.all.map do |zm|
        [zm.country.name, zm.id]
      end
    end

    def state_options
      scope = State.where(country_id: self.country_id)
      scope.all.map do |state|
        [state.name, state.id]
      end
    end

    def prepopulate!(options = {})
      super # Calls form + nested prepopulators

      if options
        self.zone_id    = options[:zone_id]
        self.country_id = options[:country_id]
        self.state_id = options[:state_id]
      else
        self.zone_id    = default_zone.id
        self.country_id = default_country.id
        self.state_id = default_state.id
      end
    end

    private

    def default_zone
      Zone.first
    end

    def default_country
      default_zone.countries.first
    end

    def default_state
      default_country.states.first
    end
  end
end
