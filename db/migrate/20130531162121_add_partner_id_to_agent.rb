class AddPartnerIdToAgent < ActiveRecord::Migration
  def change
    add_column :agents, :partner_id, :integer
  end
end
