class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :pic
      t.text :content
      t.timestamps
    end
  end
end
