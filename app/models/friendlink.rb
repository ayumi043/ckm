# encoding: utf-8

class Friendlink < ActiveRecord::Base
  attr_accessible :web_name, :url, :state
  validates :web_name, :presence => { message: "名称不能为空"}
  validates :url,
            :presence => { :message => "连接地址不能为空" },
            :format => { :with => /https?:\/\/[\S]+/,
                         :message => "请正确输入网址，以http开头"
                       }


  set_table_name 'weblink'

end