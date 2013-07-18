# encoding: utf-8

class New < ActiveRecord::Base
  attr_accessible :title, :content, :ty_id, :state, :recommended

  set_table_name 'article'

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
