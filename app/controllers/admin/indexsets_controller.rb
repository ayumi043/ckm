# encoding: utf-8

class Admin::IndexsetsController < Admin::ApplicationController
  layout "admin"

  def index
    @indexsets = Indexset.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def show
    @indexset = Indexset.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  def new
    @indexset = Indexset.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def edit
    @indexset = Indexset.find(params[:id])
  end

  def create
    @indexset = Indexset.new(params[:indexset])
    @indexset.date = Time.now
    @indexset.picture = uploadFile(params[:indexset]["picture"]) if params[:indexset]["picture"]   
    # binding.pry

    respond_to do |format|
      if @indexset.save
        format.html { redirect_to admin_indexset_url(@indexset), notice: 'indexset was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def update
    @indexset = Indexset.find(params[:id])

    respond_to do |format|
      if @indexset.update_attributes(params[:indexset])
        format.html { redirect_to admin_indexset_url(@indexset), notice: 'indexset was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  def destroy
    @indexset = Indexset.find(params[:id])
    @indexset.destroy

    respond_to do |format|
      format.html { redirect_to admin_indexsets_url }
    end
  end


end
