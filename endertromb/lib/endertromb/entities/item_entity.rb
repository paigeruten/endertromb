module Endertromb
  class ItemEntity < Entity
    def initialize(item_stack)
      @entity = net.minecraft.src.EntityItem.new($world, 0, 0, 0, item_stack.to_item_stack.item_stack)
      @entity.delayBeforeCanPickup = 10
      place_in_front_of_player
      $world.spawn_entity_in_world(@entity)
    end
  end
end
