class CreateDownloads < ActiveRecord::Migration
  def change
    create_table :downloads do |t|
 			t.string :title
      t.text :content
      t.timestamps
    end
  end
end
