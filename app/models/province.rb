class Province < ActiveRecord::Base
  attr_accessible :cha, :name

  has_many :agents
end
