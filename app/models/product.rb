class Product < ActiveRecord::Base
  attr_accessible :prodname, :picture, :description

  set_table_name "product"

  validates :prodname, :presence => { :message => "不能为空" }
  # validates :pic, :presence => //
  validates :picture, :format => {
    :with => %r{\.(png|jpg|jpeg|gif)$}i,
    :message => '格式不符合啊'
  }
end
