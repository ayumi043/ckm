class Companyinfo < ActiveRecord::Base
  attr_accessible :name, :content
  validates :name, :presence => { :message => "bu neng wei kong" }

  set_table_name 'products'
end
