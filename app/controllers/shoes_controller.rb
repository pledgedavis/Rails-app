class ShoesController < ApplicationController

  def index     
        
    #     byebug
    #    @user = current_user
  end


  def new 
   @shoes = Shoe.new
  end 
end