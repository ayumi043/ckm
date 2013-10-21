# encoding: utf-8

class Qq < ActiveRecord::Base
  attr_accessible :number, :bz

  validates :number, :presence => { message: "QQ号码不能为空!"}
  validates :bz, :presence => { message: "QQ备注不能为空!"}

end
