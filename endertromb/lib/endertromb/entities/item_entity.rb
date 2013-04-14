module Endertromb
  class ItemEntity < Entity
    def initialize(item_stack, x = nil, y = nil, z = nil)
      if z.nil?
        x = $player.posX
        y = $player.posY
        z = $player.posZ
      end
      @entity = net.minecraft.src.EntityItem.new($world, x, y, z, item_stack.to_item_stack.item_stack)
      @entity.delayBeforeCanPickup = 10
      $world.spawn_entity_in_world(@entity)
    end
  end
end
