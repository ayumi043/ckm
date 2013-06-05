# encoding: utf-8

class Partner < ActiveRecord::Base
  attr_accessible :name, :dianming, :picture, :description, :region_id, :mianji, :teshe, :renshu
  belongs_to :region

  validates :picture, :format => {
    :with => %r{\.(png|jpg|jpeg|gif)$}i,
    # :with => /^.*(.jpg|.JPG|.gif|.GIF|.png|.PNG)$/,
    :message => '您没选择图片或图片格式不对'
  }
  validates :region_id, :presence => { message: "请选择县级地区"}
  validates :name, :presence => { :message => "名称不能为空" }
  validates :dianming, :presence => { :message => "店名不能为空" }
end
