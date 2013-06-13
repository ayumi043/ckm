# encoding: utf-8

class Shenqing < ActiveRecord::Base
  attr_accessible :jtype, :region_id, :tel, :name, :email, :description

  belongs_to :region

  validates :jtype, :presence => { :message => "请选择加盟类型" }
  validates :region_id, :presence => { :message => "请选择地区" }
  validates :name, :presence => { :message => "联系人不能为空" }
  validates :tel,
            :presence => { :message => "电话号码不能为空" },
            :format => { :with => /^\d{7,11}$/i,
                         :message => "请正确填写电话号码"
                       }

  # validates :email,
  #           :presence => { :message => "电子邮件不能为空" },
  #           # :uniqueness => true,
  #           :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,
  #                        :message => "邮件格式不对"
  #                      }

  def type_name    
    re = nil
    if self.jtype == 1
      re = "我要开店"
    elsif self.jtype == 0
      re = "我要代理"    
    end
    re 
  end    
    
  def type_name=(name)    
       
  end

end
