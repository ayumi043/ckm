class New < ActiveRecord::Base
  attr_accessible :title, :content, :ty_id, :state

  set_table_name 'article'
end
