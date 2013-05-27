# encoding: utf-8

class Product < ActiveRecord::Base
  attr_accessible :prodname, :picture, :description, :category_id

  belongs_to :category

  set_table_name "product"

  validates :prodname, :presence => { :message => "名称不能为空" }
  # validates :pic, :presence => //
  validates :picture, :format => {
    :with => %r{\.(png|jpg|jpeg|gif)$}i,
    # :with => /^.*(.jpg|.JPG|.gif|.GIF|.png|.PNG)$/,
    :message => '图片格式不对'
  }
end
