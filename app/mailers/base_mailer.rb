# coding: utf-8  
class BaseMailer < ActionMailer::Base
  
  default :from => "星吉团"
  
  layout 'mailer'
  
end
