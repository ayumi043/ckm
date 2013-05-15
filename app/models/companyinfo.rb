class Companyinfo < ActiveRecord::Base
  attr_accessible :name, :content
  validates :name, :presence => { :message => "不能为空" }

  set_table_name 'products'
end
