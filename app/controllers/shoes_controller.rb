class ShoesController < ApplicationController
  before_action :check_if_logged_in
  
  def index     
    if params[:brand_id] && brand = find_brand 
       @shoes = brands.shoes 
    else
        @shoes = Shoe.ordered
     end  
    end


  def new 
  if params[:brand_id] && @brand = find_brand
        # @shoe = brand.shoes.build
        @shoe = Shoe.new 
                 @shoe.brand = @brand
    else 
        @shoe = Shoe.new 
        @shoe.build_brand
    end
  end 


  def edit
    flash[:error] = "Shoe has to belong to you to be able to edit! "
    last_created_shoe    
  end


  def create 
    # binding.pry
    # while inside of the nested route shoe_params does not have a brand_id but inside of the nested new form you need the brand_id to match the shoe your creating because without it there is no brand 
    @shoe = current_user.shoes.build(shoe_params)
    @shoe.brand = Brand.find_by_id(params[:brand_id]) if params[:brand_id]
    if @shoe.save 
        redirect_to shoe_path(@shoe)
    else
        render :new 
  end 
end

def show 
    last_created_shoe
end 

def shoebybrand
  find_brand
end

def update
  last_created_shoe
  if @shoe.update(shoe_params)
    redirect_to shoe_path(@shoe)
  else
    render :edit
  end
end

def destroy
  last_created_shoe
    @shoe.destroy
  redirect_to shoes_path
end


private
def last_created_shoe
    #finds shoe by id and redirects to shoes path if that shoe is false
 @shoe = Shoe.find_by(id: params[:id])
 
if !@shoe 
  redirect_to shoes_path
 end
end

def find_brand
  @brand= Brand.find_by(id: params[:brand_id])
end

def shoe_params
    params.require(:shoe).permit(:name, :retail_price, :resale_price, :size, :brand_id, brand_attributes:[ :id, :company_name])
 end
end