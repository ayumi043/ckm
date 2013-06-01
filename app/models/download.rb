# encoding: utf-8

class Download < ActiveRecord::Base
  attr_accessible :title, :content

  validates :title, :presence => { :message => "下载标题不能为空" }
end
