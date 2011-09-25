# coding: utf-8  
class UserMailer < BaseMailer
  
  def welcome(user)
    @user = user
    @activate_url = "http://localhost:3000/activate_account/#{@user.salt}"
    mail(:to => user.email, :subject => "亲爱的星吉团用户#{user.username}, 请激活您的账号, 完成注册")
  end
  
end
