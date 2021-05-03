class CreateRoutes < ActiveRecord::Migration[6.1]
  def change
    create_table :routes do |t|
      t.integer :id,
      t.string :name,
      t.string :type,
      t.string :rating,
      t.float :stars,
      t.integer :starVotes,
      t.string :pitches,
      t.string :location, array: true, default: [],
      t.string :url,
      t.string :imgSqSmall,
      t.string :imgSmall,
      t.string :imgSmallMed,
      t.string :imgMedium,
      t.float :longitude,
      t.float :latitude

      t.timestamps
    end
  end
end
