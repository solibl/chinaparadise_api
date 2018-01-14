module Api::V1
  class MenusController < ApplicationController
    def index
      @appetizers = Menu.where(category: 1).order(:id)
      @soup = Menu.where(category: 2).order(:id)
      @pork = Menu.where(category: 3).order(:id)
      @poultry = Menu.where(category: 4).order(:id)
      @beef = Menu.where(category: 5).order(:id)
      @seafood = Menu.where(category: 6).order(:id)
      @vegetable = Menu.where(category: 7).order(:id)
      @egg_fu_yung = Menu.where(category: 8).order(:id)
      @sizzling_iron_platters = Menu.where(category: 9).order(:id)
      @rice = Menu.where(category: 10).order(:id)
      @noodles = Menu.where(category: 11).order(:id)
      @menu = {appetizer: @appetizers, soup: @soup, pork: @pork, poultry: @poultry, beef: @beef, seafood:@seafood, vegetable: @vegetable, egg_fu_yung: @egg_fu_yung, sizzling: @sizzling_iron_platters, rice: @rice, noodle: @noodles}
      render json: @menu
    end

    def create
    	@menu = Menu.create(menu_params)
    	render json: @menu
    end

    def update
      @menu = Menu.find(params[:id])
      @menu.update_attributes(menu_params)
      render json: @menu
    end

    def destroy
      @menu = Menu.find(params[:id])
      @menu.destroy
      render json: @menu    
    end

    private

    def menu_params
    	params.require(:menu).permit(:name, :ingredients, :price, :category, :picture)
    end

  end
end