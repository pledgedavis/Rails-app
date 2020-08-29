class ShoesController < ApplicationController

  def index     
        
    #     byebug
    #    @user = current_user
  end


  def new 
   @shoe = Shoe.new
  end 
end