# encoding: utf-8

class Agent < ActiveRecord::Base
  attr_accessible :name, :description, :province_id, :region_id, :partner_id
  belongs_to :province
  belongs_to :region
  belongs_to :partner
  # validates :name, :presence => { :message => "名称不能为空" }
  validates :region_id, :uniqueness => {:message => "该省份已添加了代理商了"}

end
