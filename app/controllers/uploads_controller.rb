# encoding: utf-8

class UploadsController < ApplicationController
  def index
    
  end

  def upload

    # uploaded_io = params[:person][:picture]  
    uploaded_io = params[:upfile]
    if uploaded_io != nil
      # File.open(Rails.root.join('public', 'upload', uploaded_io.original_filename), 'wb') do |file|  
      #   file.write(uploaded_io.read)  
      # end 

      @filename=getFileName(uploaded_io.original_filename)

      file_dirname = "#{Rails.root}/public/upload/#{Time.now.strftime("%Y%m%d")}"
      if (!FileTest::exist?(file_dirname))  #判断目录是否存在，不存在则创建相应目录  
        FileUtils.makedirs(file_dirname)  
      end 

      # @filename = "abc.gif"
      File.open("#{file_dirname}/#{@filename}", 'wb') do |f|  
        f.write(uploaded_io.read)  
      end  

      binding.pry

      render json: {
        "url" => "/upload/#{Time.now.strftime("%Y%m%d")}/#{@filename}",
        "title" => uploaded_io.original_filename,
        "original" => uploaded_io.original_filename.split(".")[0],
        "fileType" => ".#{uploaded_io.original_filename.split(".").last}",
        "state" => "SUCCESS"
      }

      # binding.pry

    end

    # # 向浏览器返回数据json数据
   

    # "{'url':'" +  + "',
    #   'title':'" + title + "',
    #   'original':'" + oriName + "',
    #   'state':'" + info["state"] + "'}"
     

    # {
    #     'original': 'bg_nav.png',
    #     'url': 'image/20130504/68941367660029428.png',
    #     'title': 'bg_nav.png',
    #     'state': 'SUCCESS'
    # }
    # redirect_to upload_path
  end

  def upload1

    # uploaded_io = params[:person][:picture]  
    uploaded_io = params[:upfile]
    binding.pry
    if uploaded_io != nil
      @filename=getFileName(uploaded_io.original_filename)

      file_dirname = "#{Rails.root}/public/upload/#{Time.now.strftime("%Y%m%d")}"
      if (!FileTest::exist?(file_dirname))  #判断目录是否存在，不存在则创建相应目录  
        FileUtils.makedirs(file_dirname)  
      end 

      # @filename = "abc.gif"
      File.open("#{file_dirname}/#{@filename}", 'wb') do |f|  
        f.write(uploaded_io.read)  
      end  

      render json: {
        "url" => "/upload/#{Time.now.strftime("%Y%m%d")}/#{@filename}",
        "title" => uploaded_io.original_filename,
        "state" => "SUCCESS"
      }

      # binding.pry

    end
  end

  protected

  def getFileName(filename)  
    if !filename.nil?  
      require 'SecureRandom'  
      # binding.pry
      # filename.sub(/.*./, SecureRandom.hex+'.') 
      filename.sub(/(.*)\./.match(filename)[1], SecureRandom.hex)
    end  
  end  

end
