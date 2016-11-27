# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

america = Zone.create(name: 'America')
oceania = Zone.create(name: 'Oceania')

brazil      = Country.create(name: 'Brazil')
chile       = Country.create(name: 'Chile')
australia   = Country.create(name: 'Australia')
new_zealand = Country.create(name: 'New Zealand')

ZoneMember.create(zone: america, country: brazil)
ZoneMember.create(zone: america, country: chile)
ZoneMember.create(zone: oceania, country: australia)
ZoneMember.create(zone: oceania, country: new_zealand)

State.create(name: 'Rio de Janeiro', country: brazil)
State.create(name: 'Minas Gerais', country: brazil)
State.create(name: 'Tarapacá', country: chile)
State.create(name: 'Coquimbo', country: chile)
State.create(name: 'Queensland', country: australia)
State.create(name: 'New South Wales', country: australia)
State.create(name: 'Wellington', country: new_zealand)
State.create(name: 'Marlborough', country: new_zealand)

# City, arbitrary, as its the goal of this demo
