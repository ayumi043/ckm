class Agent < ActiveRecord::Base
  attr_accessible :name, :description, :province_id
  belongs_to :province
end
