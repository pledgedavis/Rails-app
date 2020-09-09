require 'pry'
class BrandsController < ApplicationController
 

  def index 
    if params[:shoe_id]
        @brands = Shoe.find(params[:shoe_id]).brands
      else
    @brands = Brand.all 
    end 
  end

  def show
    # binding.pry
    @brand = Brand.find_by(id: params[:id])
    if !@brand
     redirect_to brand_path
    end
  end
end