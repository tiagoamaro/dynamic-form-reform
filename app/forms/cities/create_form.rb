module Cities
  class CreateForm < Reform::Form
    property :zone_id, virtual: true
    property :country_id, virtual: true

    property :state_id
    property :name

    validates :name,
              :country_id,
              :state_id,
              presence: true

    def zone_options
      Zone.all.map { |z| [z.name, z.id] }
    end

    def country_options
      scope = zone.countries
      scope.all.map do |zm|
        [zm.name, zm.id]
      end
    end

    def state_options
      scope = country.states
      scope.all.map do |state|
        [state.name, state.id]
      end
    end

    def prepopulate!(options = {})
      super # Calls form + nested prepopulators

      options ||= {}

      self.zone_id    = options[:zone_id]
      self.country_id = options[:country_id]
      self.state_id   = options[:state_id]
      self.name       = options[:name]
    end

    private

    def zone
      Zone.find_by(id: self.zone_id) || Zone.first
    end

    def country
      zone.countries.find_by(id: self.country_id) || zone.countries.first
    end
  end
end
