# encoding: utf-8

class Jiameng < ActiveRecord::Base
  attr_accessible :title, :content, :ty_id, :state

  validates :title, :presence => { :message => "新闻标题不能为空" }

  set_table_name 'article'

  def state_name    
    re = nil
    if self.state == 1
      re = "启用"
    elsif self.state == 0
      re = "禁用"    
    end
    re 
  end    
    
  def state_name=(name)    
    # split = name.split(' ', 2)    
    # self.first_name = split.first    
    # self.last_name = split.last    
  end 
end
