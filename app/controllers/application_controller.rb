class ApplicationController < ActionController::Base
  protect_from_forgery :except => :upload


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
      require 'SecureRandom'  
      # binding.pry
      # filename.sub(/.*./, SecureRandom.hex+'.') 
      filename.sub(/(.*)\./.match(filename)[1], SecureRandom.hex)
    end  
  end

end
