class ShoesController < ApplicationController

  def index     
    # byebug
    if params[:brand_id] && brand = Brand.find_by_id(params[:brand_id]) 
       @shoes = brands.shoes 
    else
        @shoes = Shoe.all
    #     byebug
    #    @user = current_user
     end  
    end


  def new 
#    @shoe = Shoe.new   
  if params[:brand_id] && brand = Brand.find_by_id(params[:brand_id])
        @shoe = brand.shoes.build
    else 
        @shoe = Shoe.new 
        @shoe.build_brand
    end
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
    params.require(:shoe).permit(:name, :retail_price, :resale_price, :quality, :brand_id, brand_attr: [:company_name])
 end
end