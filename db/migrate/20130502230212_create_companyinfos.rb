class CreateCompanyinfos < ActiveRecord::Migration
  def change
    create_table :companyinfos do |t|

      t.timestamps
    end
  end
end
