class CreateAgents < ActiveRecord::Migration
  def change
    create_table :agents do |t|
      t.string :name
      t.text :description
      t.integer :province_id
      t.timestamps
    end
  end
end
