class GuitarsController < ApplicationController
  def index
    guitars = Guitar.all
    options = {}
    options[:include] = [:brand]
    # render json: guitars, include: :brand
    render json: GuitarSerializer.new(guitars, options)
  end

  def show
    guitar = Guitar.find_by(params[:id])
    render json: GuitarSerializer.new(guitar)
  end

  def create
    newGuitar = Guitar.create(name: params['name'], category: params['category'])
    render json: GuitarSerializer.new(newGuitar)
  end

end
