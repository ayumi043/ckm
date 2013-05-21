class Province < ActiveRecord::Base
  attr_accessible :cha, :name, :parent_id

  has_many :agents

  acts_as_nested_set
end
