module Api::V1
  class MenusController < ApplicationController
    def index
      @appetizers = Menu.where(category: 1)
      @soup = Menu.where(category: 2)
      @pork = Menu.where(category: 3)
      @poultry = Menu.where(category: 4)
      @beef = Menu.where(category: 5)
      @seafood = Menu.where(category: 6)
      @vegetable = Menu.where(category: 7)
      @egg_fu_yung = Menu.where(category: 8)
      @sizzling_iron_platters = Menu.where(category: 9)
      @rice = Menu.where(category: 10)
      @noodles = Menu.where(category: 11)
      @menu = {appetizer: @appetizers, soup: @soup, pork: @pork, poultry: @poultry, beef: @beef, seafood:@seafood, vegetable: @vegetable, egg_fu_yung: @egg_fu_yung, sizzling: @sizzling_iron_platters, rice: @rice, noodle: @noodles}
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