class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.string :name
      t.string :dianming
      t.string :picture
      t.string :mianji
      t.string :renshu
      t.string :teshe
      t.text :description
      t.integer :region_id
      t.timestamps
    end
  end
end
