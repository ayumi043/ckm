class Region < ActiveRecord::Base
  # attr_accessible :title, :body
  acts_as_nested_set
  has_many :partners
end
