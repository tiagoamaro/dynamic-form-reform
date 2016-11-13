class CreateZoneMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :zone_members do |t|
      t.references :zone
      t.references :country

      t.timestamps
    end
  end
end
