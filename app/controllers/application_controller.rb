class ApplicationController < ActionController::Base
  protect_from_forgery :except => :upload

  before_filter :load_menu_item, :rewrite_url

  def rewrite_url    
    redirect_to("http://www.chekuaimei.com#{request.path}", :status => 301)  if request.host == "www.ckm888.com" || request.host == "ckm888.com" || request.host == "www.chekuaimei.net"  
  end  

  def load_menu_item
    @abouts = About.where(:ty_id => [1,2,4], :state => 1).select("id, title")
    @jiamengs = Jiameng.where(:ty_id => 5)
    @zhaoshangs = Zhaoshang.where(:ty_id => 14)
    @categories = Category.all
    @friendlinks = Friendlink.all
    pv = Pv.first
    @pv = pv.count
    pv.update_attribute(:count, @pv + 1)
  end

  def uploadFile(file)   
    if !file.original_filename.empty?
      filename=getFileName(file.original_filename)
      file_dirname = "#{Rails.root}/public/upload/#{Time.now.strftime("%Y%m%d")}"
      if (!FileTest::exist?(file_dirname))  #判断目录是否存在，不存在则创建相应目录  
        FileUtils.makedirs(file_dirname)  
      end 

      File.open("#{file_dirname}/#{filename}", 'wb') do |f|  
        f.write(file.read)  
      end  
      
      return "/upload/#{Time.now.strftime("%Y%m%d")}/#{filename}"
    end
  end

  def getFileName(filename)  
    if !filename.nil?  
      # require 'SecureRandom'  
      # binding.pry
      # filename.sub(/.*./, SecureRandom.hex+'.') 
      # filename.sub(/(.*)\./.match(filename)[1], SecureRandom.hex)
      filename.sub(/(.*)\./.match(filename)[1], Time.now.to_f.to_s.delete('.'))
    end  
  end

end
