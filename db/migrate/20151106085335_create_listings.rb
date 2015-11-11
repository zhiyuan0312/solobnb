class CreateListings < ActiveRecord::Migration
  def change
    create_table :listings do |t|

    	t.string :list_name
    	t.string :description
    	t.integer :bedrooms
    	t.integer :bathrooms
    	t.integer :beds
    	t.string :property_type
    	t.string :room_type
    	t.integer :accomodates
    	t.string :location
        t.decimal :price, precision: 10, scale: 2
        t.belongs_to :user, index: true

      t.timestamps null: false
    end
  end
end
