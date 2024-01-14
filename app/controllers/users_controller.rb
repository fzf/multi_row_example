class UsersController < ApplicationController
  def index
    @grid = UsersGrid.new(grid_params) do |scope|
      scope.page(params[:page])
    end
  end

  protected

  def grid_params
    params.fetch(:users_grid, {}).permit!
  end
end
