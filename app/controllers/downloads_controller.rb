# encoding: utf-8

class DownloadsController < ApplicationController

	def index
		@downloads = Download.page(params[:page]).per(25)
	end

	def show
    @download = Download.find(params[:id])
  end

end
