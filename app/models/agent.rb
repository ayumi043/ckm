class Agent < ActiveRecord::Base
  attr_accessible :name, :description, :province_id
  belongs_to :province

  validates :name, :presence => { :message => "名称不能为空" }
end
