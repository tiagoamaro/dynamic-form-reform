module States
  class CreateForm < Reform::Form
    property :zone, virtual: true, prepopulator: ->(options) { self.zone = Zone.new }

    property :name

    validates :name, presence: true
  end
end
