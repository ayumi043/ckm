# encoding: utf-8

class NewsController < ApplicationController

  def index
    @abouts = About.where(:ty_id => [1,2,3,4], :state => 1)
                   .select("id, title")

    @news = Article.where(:ty_id => 23).page(params[:page]).per(20)

    respond_to do |format|
      format.html
    end
    # render :template => "movies/index"
  end

  def show
    @new = Article.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

end
