class CreateJiamengs < ActiveRecord::Migration
  def change
    create_table :jiamengs do |t|

      t.timestamps
    end
  end
end
