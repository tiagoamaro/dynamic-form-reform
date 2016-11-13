# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

america = Zone.create(name: 'America')
oceania = Zone.create(name: 'Oceania')

brazil    = Country.create(name: 'Brazil')
usa       = Country.create(name: 'United States')
australia = Country.create(name: 'Australia')
japan     = Country.create(name: 'Japan')

ZoneMember.create(zone: america, country: brazil)
ZoneMember.create(zone: america, country: usa)
ZoneMember.create(zone: oceania, country: australia)
ZoneMember.create(zone: oceania, country: japan)

# State, arbitrary, as its the goal of this demo
