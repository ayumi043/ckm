class HomeController < ApplicationController

  def index
    @agents = Province.all.map{ |i| 
      { :cha => i.cha, 
        :name => i.name, 
        :desc => i.agents.map{|i| "#{i.name}<br>#{i.description}<br>" }.join("")
      }  
    }

    @partners = Partner.first(5)
  end

end
