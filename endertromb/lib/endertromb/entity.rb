module Endertromb
  class Entity
    attr_reader :entity

    def initialize
      klass = "Entity#{self.class.to_s.sub(/^Endertromb::/, '')}".to_sym
      @entity = Java::NetMinecraftSrc.const_get(klass).new($world)
      @entity.set_position($player.posX, $player.posY, $player.posZ)
      $world.spawn_entity_in_world(@entity)
    end

    def <=>(other)
      @entity.width*@entity.height <=> other.entity.width*other.entity.height
    end

    def mount(other)
      @entity.mount_entity(other.entity)
    end
    alias_method :/, :mount

    def unmount
      if riding?
        riding_entity = @entity.ridingEntity
        @entity.ridingEntity.riddenByEntity = nil
        @entity.ridingEntity = nil
        @entity.unmount_entity(riding_entity)
      end
    end

    def move_to(*args)
      args = [args[0], @entity.posY, args[1]] if args.length == 2
      if args.length == 3
        x, y, z = *args
        @entity.get_navigator.tryMoveToXYZ(x, y, z, 0.3)
      elsif args.length == 1 && args.first.is_a?(Entity)
        @entity.get_navigator.tryMoveToEntityLiving(args.first.entity, 0.3)
      end
    end

    def eventually_explode
      Thread.new do
        loop do
          sleep 1
          break if rand(100).zero?
        end
        if @entity.entity_alive?
          explode
        end
      end
    end

    def explode(intensity=10)
      $world.create_explosion(@entity, @entity.posX, @entity.posY, @entity.posZ, intensity, true)
    end

    def move(x, y, z)
      @entity.move_entity(x, y, z)
    end

    def burn(how_long = 1000)
      @entity.set_fire(how_long)
    end

    def extinguish
      @entity.extinguish
    end

    def kill
      @entity.kill
    end

    def jump(velocity = 5)
      @entity.add_velocity(0, velocity, 0)
    end

    def to_s
      @entity.to_s
    end

    def method_missing(name, *args, &blk)
      @entity.send(name, *args, &blk)
    end
  end
end

