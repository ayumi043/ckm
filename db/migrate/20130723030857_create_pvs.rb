class CreatePvs < ActiveRecord::Migration
  def change
    create_table :pvs do |t|
			t.integer :count
      t.timestamps
    end
  end
end
