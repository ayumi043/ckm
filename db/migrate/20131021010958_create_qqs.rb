class CreateQqs < ActiveRecord::Migration
  def change
    create_table :qqs do |t|
      t.string :number
      t.string :bz

      t.timestamps
    end
  end
end
