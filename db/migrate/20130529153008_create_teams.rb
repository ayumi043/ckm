class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :picture
      t.text :description
      t.timestamps
    end
  end
end
