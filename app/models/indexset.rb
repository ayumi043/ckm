# encoding: utf-8

class Indexset < ActiveRecord::Base
  attr_accessible :module, :title, :picture, :url

  set_table_name "indexset"

  validates :module, :presence => { :message => "不能为空" }

end
