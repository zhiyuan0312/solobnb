class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
    	t.date :start_date
    	t.date :end_date
    	t.string :owner
    	t.belongs_to :user, index: true
    	t.belongs_to :listing, index: true
      t.timestamps null: false
    end
  end
end
