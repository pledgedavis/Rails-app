class SessionsController < ApplicationController

  def new 
    render :login
    @user = User.new
    
  end 

  def home 
    
  end

  def create 
    # byebug
  end 
   #logout action 
  def destroy 
    session.clear
    redirect_to '/'
  end 
end