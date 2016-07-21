class RoundsController < ApplicationController

  def index
    @users = User.all
  end

  def show
    new_match = Match.new
    new_match.newround
    @round = Round.find_by(id: params[:id])
  end

end
