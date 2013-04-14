module Endertromb
  class LightningBolt < Entity
    def initialize(*args)
      if args.length == 2
        x, z = *args
      elsif args.length == 1 && args.first.is_a?(Entity)
        x, z = args.first.posX, args.first.posZ
      else
        x ||= rand(100) - 50 + $player.posX
        z ||= rand(100) - 50 + $player.posZ
      end
      y = $world.get_precipitation_height(x, z)
      @entity = Java::NetMinecraftSrc::EntityLightningBolt.new($world, x, y, z)
      $world.add_weather_effect(@entity)
    end
  end
end
