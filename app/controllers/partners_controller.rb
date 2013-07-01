# encoding: utf-8

class PartnersController < ApplicationController

  def index
    @regions_root = Region.where(:parent_id => nil)
    @partners = Partner.page(params[:page]).per(20) 
  end

  def show
    @partner = Partner.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  def code
    @regions_root = Region.where(:parent_id => nil)
    @region = Region.where(:cha => params[:code]).first
    @partners = Partner.where(
      :region_id => @region.leaves.map {|i| i.id }
    ).page(params[:page]).per(20) 
    render 'index'
  end

end
