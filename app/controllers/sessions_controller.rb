# require 'pry'
class SessionsController < ApplicationController

  def new 
    # render :login
    # byebug
    @user = User.new
    # render :new
  end 

  def home 
    
  end

  def create 
      byebug
    # byebug
  end 
   #logout action 
  def destroy 
    session.clear
    redirect_to '/'
  end 
end