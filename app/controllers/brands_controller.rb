require 'pry'
class BrandsController < ApplicationController
 

  def index 
    if params[:shoe_id]
        @brands = Shoe.find(params[:shoe_id]).brands
      else
    @brands = Brand.order_by_name
    end 
  end

  def show
    @brand = Brand.find_by(id: params[:id])
    if !@brand
     redirect_to brand_path
    end
  end
end