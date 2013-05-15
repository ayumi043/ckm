class Product < ActiveRecord::Base
  attr_accessible :prodname, :picture, :description

  set_table_name "product"

  validates :prodname, :presence => { :message => "bu neng wei kong" }
  # validates :pic, :presence => //
  validates :picture, :format => {
    :with => %r{\.(png|jpg|jpeg|gif)$}i,
    :message => 'ge shi bu dui'
  }
end
