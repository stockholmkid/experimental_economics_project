class RoundsController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @round = Round.find_by(id: params[:id])
  end

end
