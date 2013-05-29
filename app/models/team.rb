class Team < ActiveRecord::Base
  attr_accessible :name, :dianming, :picture, :description, :region_id, :mianji, :teshe, :renshu

  validates :name, :presence => { :message => "名称不能为空" }
  validates :dianming, :presence => { :message => "团队名称不能为空" }
end
