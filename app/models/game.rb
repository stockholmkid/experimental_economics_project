class Game < ApplicationRecord

   def self.start(leader, follower)
     leader, follower = [leader, follower]

     ActionCable.server.broadcast "player_#{leader}", {action: "game_start", msg: "Leader"}
     ActionCable.server.broadcast "player_#{follower}", {action: "game_start", msg: "Follower"}

     # Store the details of each opponent
     REDIS.sadd("opponent_for:#{leader}", follower)
     REDIS.sadd("opponent_for:#{follower}", leader)
   end


end
