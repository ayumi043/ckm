class Admin::ArticlesController < ApplicationController

  def index
    @articles = Article.where(:ty_id => 23)

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @article = Article.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @article = Article.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

   # POST /posts
  def create
    @article = Article.new(params[:article])
    @article.pulishdate = Time.now
    @article.ty_id = 23
    respond_to do |format|
      if @article.save
        format.html { redirect_to admin_article_url(@article), notice: 'new was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @article = Article.find(params[:id])

    respond_to do |format|
      if @article.update_attributes(params[:article])
        format.html { redirect_to admin_articles_url, notice: 'new was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    respond_to do |format|
      format.html { redirect_to admin_articles_url }
    end
  end

end
