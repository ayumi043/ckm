class Indexset < ActiveRecord::Base
  attr_accessible :module, :title, :picture, :url

  set_table_name "indexset"

  validates :module, :presence => { :message => "bu neng wei kong" }

end
