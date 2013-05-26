class Area < ActiveRecord::Base
  # attr_accessible :title, :body
  set_table_name 'area'
  acts_as_nested_set
end
