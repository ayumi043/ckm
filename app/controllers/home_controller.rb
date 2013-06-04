# encoding: utf-8

class HomeController < ApplicationController

  def index
    # @agents = Province.all.map{ |i| 
    #   { :cha => i.cha, 
    #     :name => i.name, 
    #     :desc => i.agents.map{|i| "#{i.name}<br>#{i.description}<br>" }.join("")
    #   }  
    # }

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

    @partners = Partner.first(5)
  end

end
