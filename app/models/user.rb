class User < ActiveRecord::Base
  attr_accessible :hashed_password, :username, :salt, :password, :updated_at

  validates :username, 
            :presence => { :message => "用户不能为空" },
            :uniqueness => { :message => "用户名已存在" },
            :length => {:within => 3..40, :message => "用户名至少得3个字符" }

  validates :password, 
            # :presence => { :message => "密码不能为空" },
            :length => {:within => 6..40, :message => "密码至少得6个字符"}

  def password
    @password
  end
  
  def password=(pass)
    return unless pass
    @password = pass
    generate_password(pass)
  end
  
  def self.authenticate(username, password)
    user = User.find_by_username(username)
    if user && Digest::SHA256.hexdigest(password + user.salt) == user.hashed_password
      return user
    end
    # binding.pry
    false
  end
  
  private
  def generate_password(pass)
    salt = Array.new(10){rand(1024).to_s(36)}.join
    self.salt, self.hashed_password = 
      salt, Digest::SHA256.hexdigest(pass + salt)
  end

end
