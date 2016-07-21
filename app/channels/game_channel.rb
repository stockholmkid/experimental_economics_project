# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class GameChannel < ApplicationCable::Channel
  def subscribed
    stream_from "#{current_user.studentid}"
    Match.create(current_user)
    
  end

  def new_game()
    Game.new_game(current_user)
  end
end
