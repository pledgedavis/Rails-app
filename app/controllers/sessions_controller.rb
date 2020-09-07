# require 'pry'
class SessionsController < ApplicationController

  def new 
    # render :login
    # byebug
    @user = User.new
    render :login
  end 

  def home 
    
  end

#   def create 
#       # byebug
#       #finds created user by username and then uses authenticate to verify the password
#       @user = User.find_by(username: params[:user][:username])
#      if @user && @user.authenticate(params[:user][:password])
#       session[:user_id] = @user.id
#       redirect_to user_path(@user)
#      else 
#       flash[:error] = "Sorry, Your username or password was incorrect please try again!"
#       redirect_to 'login'
#      end
#   end 
#    #logout action 
#   def destroy 
#     session.clear
#     redirect_to '/'
#   end 

#   def fbcreate 
#     @user = User.from_omniauth(auth)
#     @user.save
#     session[:user_id] = @user.id
#    redirect_to user_path(@user)
#     end
 
#   def auth
#     request.env['omniauth.auth']
#   end

# end



def create 
  @user = User.find_by(username: params[:user][:username])
if @user && @user.authenticate(params[:user][:password])
          session[:user_id] = @user.id
          redirect_to user_path(@user)
  else
    flash[:error] = "Incorrect username or password try again! "
    redirect_to '/login'
end
end

#omniauth
def fbcreate 
@user = User.find_or_create_by(uid: auth['uid']) do |u|
  u.username = auth['info']['username']
  u.email = auth['info']['email']
  u.password = auth['uid'] #Secure Random Hex
end

session[:user_id] = @user.id

redirect_to '/shoes'
end

def destroy
session.delete(:user_id)
flash[:notice] = "User logged out"
redirect_to '/' 
end

def auth
request.env['omniauth.auth']
end
end