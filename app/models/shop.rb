# encoding: utf-8

class Shop < ActiveRecord::Base
  attr_accessible :name, :dianming, :picture, :description, :region_id, :mianji, :teshe, :renshu
  belongs_to :region

  validates :name, :presence => { :message => "名称不能为空" }
  validates :dianming, :presence => { :message => "店名不能为空" }
end
