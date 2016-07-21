class Match < ApplicationRecord

  def self.create(current_user)
      if REDIS.smembers("leaders").count < 2
         REDIS.sadd("leaders", current_user.studentid)
      elsif !REDIS.smembers("leaders").include? "#{current_user.studentid}"
        REDIS.sadd("followers", current_user.studentid)
      end

  end


  def newround
      REDIS.sunionstore("templeaders", "leaders")
      REDIS.sunionstore("tempfollowers", "followers")

      2.times do
        REDIS.smembers("templeaders").shuffle
        REDIS.smembers("tempfollowers").shuffle
        player1 = REDIS.smembers("templeaders")[0]
        player2 = REDIS.smembers("tempfollowers")[0]
        Game.start(player1, player2)
        REDIS.srem("templeaders", player1)
        REDIS.srem("tempfollowers", player2)
      end
  end
end
