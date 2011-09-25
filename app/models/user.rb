class User < ActiveRecord::Base
  
  has_many :orders
  has_many :carts
  
  has_many :favors
  
  before_create :default_value_for_create
  #after_create :send_welcome_mail
  
  #attr_protected :email, :username, :state
  #attr_accessor :password_confirm
  
  validates_presence_of :email, :username, :password
  validates_confirmation_of :password
  validates_uniqueness_of :email
  validates_length_of :username, :in => 2..32
  validates_length_of :password, :in => 6..32
  validates_format_of :email, :with => /^[0-9a-zA-Z_][\w\.-]*[a-zA-Z0-9_]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$/  
  
  STATE = {
    :new => 0,
    :normal => 1,
    # 屏蔽
    :blocked => 2
  }
  
  def self.check_login(email, password)
    user = self.find_by_email(email)
    if user
      if user.encrypted_password(password).to_s!=user.password.to_s
        nil
      else
        user
      end
    else
      nil
    end
  end
  
  def send_activate_email
    self.last_login_at = Time.now
    #self.salt = generate_salt
    self.save!
    UserMailer.welcome(self).deliver
  end
  
  def activate
    #self.state = STATE[:normal]
    self.last_login_at = Time.now
    #self.salt = generate_salt
    self.save!
  end
  
#  def send_welcome_mail
#    m = UserMailer.welcome(self)
#    Thread.new { m.deliver }
#  rescue => e
#    logger.error { e }
#  end
  
  def default_value_for_create
    self.password = encrypted_password(self.password)
    #self.state = STATE[:new]
    self.last_login_at = Time.now
    #self.salt = generate_salt
  end

  def generate_salt
    encrypted_password(self.email + self.last_login_at.strftime("%h%s").to_s + "xingjibuy")
    # self.object_id.to_s + rand.to_s
  end
  
  def encrypted_password(password)
    Digest::MD5.hexdigest(password)
  end
  
  
end
