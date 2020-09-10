require 'pry'
class SessionsController < ApplicationController

  def new 
    # render :login
    # byebug
    @user = User.new
    render :login
  end 

  def home 
    
  end

 def create 
   #finds created user by username and then uses authenticate to verify the password
    @user = User.find_by(username: params[:user][:username])
   if @user && @user.authenticate(params[:user][:password])
          session[:user_id] = @user.id
          redirect_to home_path
   else
    flash[:error] = "Sorry, Your username or password was incorrect please try again! "
    redirect_to '/login'
   end
 end

#omniauth
 def fbcreate 
  @user = User.find_or_create_by(uid: auth['uid']) do |u|
  # binding.pry
    u.username = auth['info']['name']
    u.email = auth['info']['email']
    u.password = auth['uid'] 
  end

   session[:user_id] = @user.id
# byebug

   redirect_to '/shoes'
 end

 def destroy 
  session.clear
   flash[:notice] = "User logged out"
  redirect_to '/'
 end 


 def auth
  request.env['omniauth.auth']
 end
end