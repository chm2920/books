# coding: utf-8  
class UsersController < ApplicationController
  
  layout "note"

  def reg
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @user.email = params[:user][:email]
    @user.username = params[:user][:username]
    @user.current_login_ip = request.remote_ip
    @user.last_login_ip = request.remote_ip
    ActiveRecord::Base.transaction do
      begin
        @user.save!
        session[:user_id] = @user.id
        session[:username] = @user.username
        #UserMailer.welcome(@user).deliver
      rescue Exception => e
        ActiveRecord::Rollback
        record_error(e)
        render :action => "reg"
      else
        render :action => "create"
      end
    end
  end

  def edit
    @user = User.find(session[:user_id])
  end

  # PUT /users/1
  # PUT /users/1.xml
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def login
     flash[:notice] = nil
  end
  
  def login_rst
    @user = User.check_login(params[:user_id], params[:pwd])
    if @user
      session[:user_id] = @user.id
      session[:username] = @user.username
      redirect_back
    else
      flash[:notice] = '邮箱地址 或 密码错误.'
      render :action => "login"
    end
  end
  
  def logout
    session[:user_id] = nil
    session[:username] = nil
    redirect_to "/"
  end
  
  def send_activate_email
    begin
      @user = User.find(session[:user_id])
      @user.send_activate_email
    rescue Exception => e
      record_error(e)
      render "500", :info => "请重新登陆"
    end
  end
  
  def activate
    begin
      @user = User.find_by_salt(params[:id])
      @user.activate
    rescue Exception => e
      record_error(e)
      render "500", :info => "验证已过期，请重新申请，或者联系客服。"
    end
  end
  
end
