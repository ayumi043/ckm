class CreateShenqings < ActiveRecord::Migration
  def change
    create_table :shenqings do |t|
      t.integer :jtype
      t.integer :region_id
      t.string :tel
      t.string :name
      t.string :email
      t.text :description
      t.timestamps
    end
  end
end
