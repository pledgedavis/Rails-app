class ShoesController < ApplicationController

  def index     
        
    #     byebug
    #    @user = current_user
  end


  def new 
   @shoe = Shoe.new
  end 


  def create 
    # byebug
    @shoe = current_user.shoes.build(shoe_params)
    if @shoe.save 
        redirect_to shoe_path(@shoe)
    else
        render :new 
  end 
end

def show 
    last_created_shoe
end 

private
def last_created_shoe
    #finds shoe by id and redirects to shoes path if that shoe is false
 @shoe = Shoe.find_by(id: params[:id])
 if !@shoe
  redirect_to shoes_path
 end
end


def shoe_params
    params.require(:shoe).permit(:name, :retail_price, :resale_price, :quality, :brand_id)
 end
end