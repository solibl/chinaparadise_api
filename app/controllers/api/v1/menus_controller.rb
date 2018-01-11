module Api::V1
  class MenusController < ApplicationController
    def index
      @menu = Menu.all
      render json: @menu
    end

    def create
    	@menu = Menu.create(menu_params)
    	render json: @menu
    end

    private

    def menu_params
    	params.require(:menu).permit(:name, :ingredients, :price, :category)
    end

  end
end