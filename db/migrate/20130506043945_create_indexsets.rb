class CreateIndexsets < ActiveRecord::Migration
  def change
    create_table :indexsets do |t|

      t.timestamps
    end
  end
end
