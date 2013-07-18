# encoding: utf-8

class HomeController < ApplicationController

  def index
    @agents = Region.where(:parent_id => nil).map { |i| 
      if i.agent 
        # p = i.try(:agent).try(:partner)
        # desc = p.try(:name) + "<br>" + "面积:" + p.try(:mianji)+ "<br>"  
        p = i.agent.partner
        desc = "<span>店名:#{p.name}</span><br>面积:#{p.mianji}<br>"
      else
        desc =""  
      end  
      {
        :cha => i.cha, 
        :name => i.region_name, 
        :desc => desc
          
      }  
    }

    @services = Product.where(:category_id => 5).order("recommended desc").first(3)
    @products = Product.where(:category_id => 1).order("recommended desc").first(4)
    @zhaoshangs = Zhaoshang.where(:ty_id => 14)
    @partners = Partner.order("recommended desc").first(5)
    @indexsets = Indexset.all
    @allnews = Article.where(:ty_id => 23).order("recommended desc").first(7)
  end

end
