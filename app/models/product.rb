# encoding: utf-8

class Product < ActiveRecord::Base
  attr_accessible :prodname, :picture, :description, :category_id, :recommended

  belongs_to :category

  set_table_name "product"

  validates :prodname, :presence => { :message => "名称不能为空" }
  # validates :pic, :presence => //
  validates :picture, 
            :presence => { :message => "请选择上传的图片" },
            :format => {
    :with => %r{\.(png|jpg|jpeg|gif)$}i,
    # :with => /^.*(.jpg|.JPG|.gif|.GIF|.png|.PNG)$/,
    :message => '图片格式不对'
  }

  def recommended_name    
    re = nil
    if self.recommended == 1
      re = "推荐"
    elsif self.recommended == 0
      re = "未推荐"    
    end
    re 
  end    
    
  def recommended_name=(name)    
  end    

end
