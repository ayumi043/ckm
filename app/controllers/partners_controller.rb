# encoding: utf-8

class PartnersController < ApplicationController

  def index
    @partners = Partner.page(params[:page]).per(20) 
  end

  def show
    @partner = Partner.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  def code
    @partners = Partner.find(params[:id])
    render 'index'
  end

end
