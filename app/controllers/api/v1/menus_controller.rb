module Api::V1
  class MenusController < ApplicationController
    def index
      @menu = Menu.all
      render json: @ideas
    end
  end
end