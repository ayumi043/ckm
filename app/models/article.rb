class Article < ActiveRecord::Base
  attr_accessible :title, :content, :ty_id, :state

  set_table_name 'article'

  def state_name    
    re = nil
    if self.state == 1
      re = "enable"
    elsif self.state == 0
      re = "disable"    
    end
    re 
  end    
    
  def state_name=(name)    
    # split = name.split(' ', 2)    
    # self.first_name = split.first    
    # self.last_name = split.last    
  end 

end
