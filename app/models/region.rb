# encoding: utf-8

class Region < ActiveRecord::Base
  # attr_accessible :title, :body
  acts_as_nested_set
  has_many :partners
  has_many :shops
end
