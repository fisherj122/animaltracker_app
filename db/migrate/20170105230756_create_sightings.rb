class CreateSightings < ActiveRecord::Migration
  def change
    create_table :sightings do |t|
      t.datetime :date
      t.integer :latitude
      t.integer :longitude

      t.timestamps null: false
    end
    add_reference(:sightings, :animal, index: true)
  end
end
