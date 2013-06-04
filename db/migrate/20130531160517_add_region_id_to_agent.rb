class AddRegionIdToAgent < ActiveRecord::Migration
  def change
    add_column :agents, :region_id, :integer
  end
end
