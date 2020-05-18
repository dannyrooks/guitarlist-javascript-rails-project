class GuitarsController < ApplicationController
  def index
    guitars = Guitar.all
    render json: GuitarSerializer.new(guitars)
  end

  def show
    guitar = Guitar.find_by(params[:id])
    render json: GuitarSerializer.new(guitar)
  end

  def create
    newGuitar = Guitar.create(brand_id: params['brand_id'], name: params['name'], category: params['category'], year: params['year'])
    render json: GuitarSerializer.new(newGuitar)
  end

  def destroy
    guitar = Guitar.find_by(id: params[:id])
  end

end
