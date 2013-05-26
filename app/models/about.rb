class About < ActiveRecord::Base
  attr_accessible :title, :content, :ty_id, :state

  set_table_name 'article'


  # Getter    
  def state_name    
    re = nil
    if self.state == 1
      re = "启用"
    elsif self.state == 0
      re = "禁用"    
    end
    re 
  end    
    
  # Setter    
  def state_name=(name)    
    # split = name.split(' ', 2)    
    # self.first_name = split.first    
    # self.last_name = split.last    
  end    

end
